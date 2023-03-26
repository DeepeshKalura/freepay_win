import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/profile_model.dart';
import 'firebase_controller.dart';

class ProfileController {
  final fireStore = FirebaseFirestore.instance;
  final FirebaseController firebaseController = FirebaseController();

  Future<ProfileModel> getDetails() async {
    var data = await fireStore
        .collection('profile')
        .doc(firebaseController.auth.currentUser!.uid)
        .get();
    var myUser = ProfileModel.fromJson(jsonEncode(data.data()));

    return myUser;
  }
}
