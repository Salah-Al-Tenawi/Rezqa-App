// ignore: file_names
import 'dart:io';

import 'package:dio/dio.dart';

Future uploadFiletoApi(File image) async {
  return await MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}

