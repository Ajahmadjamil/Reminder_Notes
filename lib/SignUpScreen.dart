import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reminder_notes/LoginScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> signUpForm = GlobalKey<FormState>();
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  height: 350,
                  child: Lottie.asset("assets/login_animation.json")),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                      border: Border.all(
                        width: 3,
                        color: Colors.grey.withOpacity(0.1),
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 24),
                      child: Form(
                          key: signUpForm,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start ,
                            children: [
                              const SizedBox(height: 20),
                              const Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "Create Your Account",
                                  style: TextStyle(
                                    fontSize: 22, // Adjust size as needed
                                    color:
                                    Colors.black, // Adjust color as needed
                                  ),
                                ),
                              ),
                              const SizedBox(height: 36),
                              TextFormField(
                                controller: userName,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                  labelText: 'Enter user name',
                                  labelStyle: TextStyle(color: Colors.black),
                                  hintStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.person, color: Colors.blue),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the User name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: phone,
                                style: const TextStyle(color: Colors.black),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Enter phone',
                                  labelStyle: TextStyle(color: Colors.black),
                                  hintStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
        
                                  prefixIcon: Icon(Icons.phone, color: Colors.blue), // <-- Phone icon added here
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the Phone Number';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: email,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                  labelText: 'Enter Email Address',
                                  labelStyle: TextStyle(color: Colors.black),
                                  hintStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.mail, color: Colors.blue),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the Email Address';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: password,
                                obscureText: !_passwordVisible,
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.blue,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                  labelText: 'Enter Password',
                                  labelStyle:
                                  const TextStyle(color: Colors.black),
                                  hintText: 'Password',
                                  prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                                  hintStyle:
                                  const TextStyle(color: Colors.black54),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  border: const OutlineInputBorder(),
        
                                ),
                              ),
                              const SizedBox(height: 8),
                              InkWell(
                                onTap: loginToFirebase,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.blueAccent
                                    ),
                                    child: const Center(child: Text("SignUp",style:
                                    TextStyle(color: Colors.white,
                                        fontSize: 18
                                    ),
                                    )),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Already have an account ",
                                    style: TextStyle(
                                      fontSize: 14, // Adjust size as needed
                                      color:
                                      Colors.black, // Adjust color as needed
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginScreen(),
                                      ),
                                          (Route<dynamic> route) => false,
                                    ),
                                    child: const Text(
                                      "Sign In",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 14, // Adjust size as needed
                                        color:
                                        Colors.black, // Adjust color as needed
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> loginToFirebase() async {
  }
  Future<void> forgotPassword() async {
  }

}

