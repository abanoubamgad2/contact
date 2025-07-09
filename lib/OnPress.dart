import 'dart:io';

import 'package:flutter/foundation.dart'; // هذه المكتبة تحتوي على debugPrint
import 'package:image_picker/image_picker.dart';

Future<File?> pickAndReplaceImage() async {
  try {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      await file.exists(); // تأكد من وجود الملف
      return file;
    }
  } catch (e) {
    if (kDebugMode) {
      print('Image picker error: $e'); // بديل عن debugPrint إذا استمرت المشكلة
    }
  }
  return null;
}
