import 'dart:io';

Future<bool> checkSizeImage(File image) async {
  final int sizeInBytes = await image.length();
  final double sizeInMB = sizeInBytes / (1024 * 1024);
  if (sizeInMB > 2) {
    return false;
  } else {
    return true;
  }
}
