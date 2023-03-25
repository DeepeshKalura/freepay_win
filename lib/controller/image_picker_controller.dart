import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerController {
  final _imagePicker = ImagePicker();

  Future<File> pickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);

    return pickedFile != null
        ? File(pickedFile.path)
        : File('assets/images/defaultUser.png');
  }
}
