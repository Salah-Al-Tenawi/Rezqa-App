import 'dart:io';

Future<bool> checkSizeFile(File image, String type) async {
  final int sizeInBytes = await image.length();
  final double sizeInMB = sizeInBytes / (1024 * 1024);
  if (type == "image") {
    if (sizeInMB > 2) {
      return false;
    } else {
      return true;
    }
  }
  if (type == "file") {
    if (sizeInMB > 1) {
      return false;
    } else {
      return true;
    }
  } else {
    return false;
  }
}
