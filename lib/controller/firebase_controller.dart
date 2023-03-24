import 'package:firebase_auth/firebase_auth.dart';

class FirbaseController {

  final FirebaseAuth auth = FirebaseAuth.instance;

  // Implemeting Sign In with Email and Password

  Future<String> logInInWithEmailAndPassword(String email, String password) async {
    String result = "Unsuccessful";
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      result = "Successful";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        
        result = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        result = "Wrong password provided for that user.";
      }
    }catch (e){
      result = e.toString();
    }
      return result;
  }
  // Implementing Sign Up with Email and Password

  Future<String> signUpWithEmailAndPassword(String email, String password) async {
    String result = "Unsuccessful";
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      result = "Successful";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        result = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        result = "The account already exists for that email.";
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }
  
  // Implementing Sign Out
  Future<String> signOut() async {
    String result = "Unsuccessful";
    try {
      await auth.signOut();
      result = "Successful";
    } catch (e) {
      result = e.toString();
    }
    return result;
  }
  // Implementing Forgot Password
  Future<String> forgotPassword(String email) async {
    String result = "Unsuccessful";
    try {
      await auth.sendPasswordResetEmail(email: email);
      result = "Successful";
    } catch (e) {
      result = e.toString();
    }
    return result;
  }
}