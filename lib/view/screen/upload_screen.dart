import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/rotues.dart';
import '../widget/rounded_widget.dart';
import '../../controller/image_picker_controller.dart';
import '../../controller/firebase_controller.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? isImage;
  final ImagePickerController _imagePickerController = ImagePickerController();
  String situationTextNotifier = 'Upload Your Document';
  final FirbaseController _firbaseController = FirbaseController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Upload'),
          elevation: 0,
          actions: [
            // Making Logout Button
            IconButton(
              onPressed: () {
                _firbaseController.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, MyRoutes.loginScreen, (route) => false);
              },
              icon: const Icon(Icons.logout, color: Colors.white),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 150,
                width: 250,
                margin: const EdgeInsets.all(10),
                child: isImage == null
                    ? const Icon(
                        Icons.upload_file_outlined,
                        size: 150,
                        color: Colors.black,
                      )
                    : Image.file(
                        isImage!,
                      ),
              ),
            ),
            Text(situationTextNotifier,
                style: Theme.of(context).textTheme.titleMedium),
            RoundedButtonWidget(
              onpressed: () {
                _imagePickerController
                    .pickImage(ImageSource.gallery)
                    .then((value) {
                  setState(() {
                    isImage = value;
                    situationTextNotifier = 'Image Selected';
                  });
                });
              },
              width: MediaQuery.of(context).size.width * 0.8,
              buttonText: 'Slected',
            ),
          ],
        ),
      ),
    );
  }
}
