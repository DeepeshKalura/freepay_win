import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../controller/firebase_controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirbaseController _firbaseController = FirbaseController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
              ),
              Image.asset("assets/logo/auth_logo.png"),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Create Account!',
                    textStyle: const TextStyle(
                      color: Colors.purple,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                    speed: const Duration(
                      milliseconds: 450,
                    ),
                  ),
                ],
                isRepeatingAnimation: true,
                totalRepeatCount: 6,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _userNameController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Enter Your Full Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Enter Your Email/Username',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: 'Enter Your Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          ElevatedButton(
                            onPressed: (() async {
                              final result = await _firbaseController
                                  .signUpWithEmailAndPassword(
                                _emailController.text,
                                _passwordController.text,
                              );
                              // Implement the scaffold messager
                              if (result != "Successful") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(result),
                                  ),
                                );
                              }
                            }),
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                Size(MediaQuery.of(context).size.width * 0.74,
                                    40),
                              ),
                            ),
                            child: const Text(
                              'Sign Up',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                          ),
                          TextButton(
                            onPressed: (() {
                              Navigator.pop(context);
                            }),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
