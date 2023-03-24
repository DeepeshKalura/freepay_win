import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../controller/firebase_controller.dart';
import '../../controller/rotues.dart';
import '../../view/widget/rounded_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirbaseController _firbaseController = FirbaseController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Kreedy Parther App',
                    textStyle: Theme.of(context).textTheme.titleLarge,
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
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          hintText: 'Enter Your Email',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: 'Enter Your Password',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          RoundedButtonWidget(
                            onpressed: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.uploadScreen);
                            },
                            buttonText: 'Login',
                            width: MediaQuery.of(context).size.width * 0.74,
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.55,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.forgotPassword);
                            },
                            child: Text(
                              'Forgot Password?',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        TextButton(
                          onPressed: (() {
                            _firbaseController.signUpWithEmailAndPassword(
                              _emailController.text,
                              _passwordController.text,
                            );
                          }),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
