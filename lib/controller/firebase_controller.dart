import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../model/profile_model.dart';

class FirebaseController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  Future<String> uploadImage(File imageFile) async {
    final ref = storage.ref().child('imageUrl').child(auth.currentUser!.uid);
    final uploadTask = ref.putFile(imageFile);
    await uploadTask;
    final url = await ref.getDownloadURL();

    return url;
  }

  Future<String> uploadProfile(
      String userName, String email, File imageFile) async {
    var result = "Error while uploading";
    try {
      var imageUrl = await uploadImage(imageFile);
      final ProfileModel myUser = ProfileModel(
          userId: auth.currentUser!.uid,
          username: userName,
          email: email,
          imageUrl: imageUrl);
      await fireStore
          .collection('profile')
          .doc(auth.currentUser!.uid)
          .set(json.decode(myUser.toJson()));

      result = "Successful";
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  Future<String> signUpFunction({
    required String email,
    required String password,
    required File imageFile,
    required String userName,
  }) async {
    String result = "Unsuccessful";
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      var bresult = await uploadProfile(userName, email, imageFile);
      if (bresult == "Successful") {
        result = "Successful";
      } else {
        result = bresult;
      }

      result = "Successful";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        result = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        result = "Wrong password provided for that user.";
      } else {
        result = e.toString();
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  Future<String> logInFunction(String email, String password) async {
    String result = "Unsuccessful";
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      result = "Successful";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        result = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        result = "The account already exists for that email.";
      } else {
        result = e.toString();
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
