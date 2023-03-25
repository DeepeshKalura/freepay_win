import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'controller/firebase_controller.dart';
import 'controller/rotues.dart';
import 'firebase_options.dart';
import 'view/screen/auth/forget_password_screen.dart';
import 'view/screen/auth/login_screen.dart';
import 'view/screen/auth/sign_up_screen.dart';
import 'view/screen/homedashboard.dart';

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
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          MyRoutes.loginScreen: (context) => const LoginScreen(),
          MyRoutes.signUpScreen: (context) => const SignUp(),
          MyRoutes.forgotPassword: (context) => const ForgotPassword(),
          MyRoutes.checker: (context) => Checker(),
          MyRoutes.homeScreen: (context) =>
              const HomeDashBoardNaviagtorScreen(),
        });
  }
}

class Checker extends StatelessWidget {
  Checker({super.key});
  final FirbaseController _firbaseController = FirbaseController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firbaseController.auth.authStateChanges(),
      builder: (context, snapShot) {
        switch (snapShot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.none:
            return const Scaffold(
              body: Center(
                child: Text('No Internet Connection'),
              ),
            );
          case ConnectionState.active:
            if (snapShot.hasData) {
              return const HomeDashBoardNaviagtorScreen();
            } else {
              return const LoginScreen();
            }

          case ConnectionState.done:
            return const Scaffold(
              body: Center(
                child: Text('Done'),
              ),
            );
        }
      },
    );
  }
}
