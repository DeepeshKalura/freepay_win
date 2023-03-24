import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'controller/rotues.dart';
import 'firebase_options.dart';
import 'view/screen/forget_password_screen.dart';
import 'view/screen/login_screen.dart';
import 'view/screen/sign_up_screen.dart';
import 'view/screen/upload_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        initialRoute: '/',
        routes: {
          MyRoutes.uploadScreen: (context) => const UploadScreen(),
          MyRoutes.loginScreen: (context) => const LoginScreen(),
          MyRoutes.signUp: (context) => const SignUp(),
          MyRoutes.forgotPassword: (context) => const ForgotPassword(),
          MyRoutes.checker: (context) => const Checker(),
        });
  }
}

class Checker extends StatelessWidget {
  const Checker({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          return const UploadScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
