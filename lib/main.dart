import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freepay/view/screen/homedashboard.dart';

import 'controller/firebase_controller.dart';
import 'firebase_options.dart';
import 'view/screen/auth/login_screen.dart';
import 'view/screen/work/create/create_project_screen.dart';

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
      home: const HomeDashBoardScreen(),
      debugShowCheckedModeBanner: false,
      //initialRoute: '/',
      // routes: {
      //   MyRoutes.uploadScreen: (context) => const UploadScreen(),
      //   MyRoutes.loginScreen: (context) => const LoginScreen(),
      //   MyRoutes.signUp: (context) => const SignUp(),
      //   MyRoutes.forgotPassword: (context) => const ForgotPassword(),
      //   MyRoutes.checker: (context) => Checker(),

      // });
    );
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
        if (snapShot.hasData) {
          return const CreateProjectPageScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
