import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class ImagePickerController extends ChangeNotifier {
  static const String boxName = 'imageBox';
  static const String imagePathKey = 'imagePath';

  String? imagePath;

  ImagePickerController() {
    getImagePathFromHive();
  }

  Future<String?> pickAndSaveImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      final String imagePath = await _saveImageToLocalStorage(image);
      await _saveImagePathToHive(imagePath);

      return imagePath;
    }
    return null;
  }

  Future<String> _saveImageToLocalStorage(XFile image) async {
    final Directory appDir = await getApplicationDocumentsDirectory();
    final String fileName = path.basename(image.path);
    final String savedImagePath = path.join(appDir.path, fileName);

    await File(image.path).copy(savedImagePath);
    return savedImagePath;
  }

  Future<void> _saveImagePathToHive(String imagePath) async {
    final box = await Hive.openBox(boxName);

    await box.put(imagePathKey, imagePath);

    getImagePathFromHive().toString();
  }

  Future getImagePathFromHive() async {
    final box = await Hive.openBox(boxName);

    imagePath = box.get(imagePathKey);

    log(imagePath.toString());

    notifyListeners();
  }

  Future<ImageSource?> showImageSourceDialog(BuildContext context) async {
    return showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text('Camera'),
                  onTap: () async {
                    pickAndSaveImage(ImageSource.camera);
                    Navigator.of(context).pop(ImageSource.camera);
                  },
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: const Text('Gallery'),
                  onTap: () async {
                    pickAndSaveImage(ImageSource.gallery);
                    Navigator.of(context).pop(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
