import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freelanc/core/functions/check_size_image.dart';
import 'package:freelanc/core/functions/show_size_warning.dart';
import 'package:freelanc/core/helper/shared_api_functions.dart';
import 'package:freelanc/core/repository/profiles/profile_freelancer_repo.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class FreeProfileController extends GetxController {
  removeItemForList(int index, List list);
  editprofile();
  addImagefront();
  selectbirthday(BuildContext context);
  changegender(String selectgender);
}

class FreeProfileControllerIm extends FreeProfileController {
  late GlobalKey<FormState> formkey;
  late ImagePicker imagePicker;
  late TextEditingController headline;
  late TextEditingController description;
  late TextEditingController joprole;
  late TextEditingController city;
  String birthday = "xxxx/xx/xx   ";
  String gender = "male";
  String? profileImageId;
  String? backgroundImageId;
  String? profileImageUrl;
  String? backgroundImageUrl;
  late SharedApiFunctionIm sharedApiFunctionIm;
  List<String> skillesId = [
    "java ",
    "c++ ",
    "Css ",
    " Html ",
    "Prolog",
    "Flutter",
    "php ",
  ];

  @override
  void onInit() {
    formkey = GlobalKey<FormState>();
    headline = TextEditingController();
    description = TextEditingController();
    joprole = TextEditingController();
    city = TextEditingController();
    imagePicker = ImagePicker();
    sharedApiFunctionIm = Get.put(SharedApiFunctionIm());
    super.onInit();
  }

  @override
  void selectbirthday(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      // initialDate: DateTime.now(),
      firstDate: DateTime(1924),
      lastDate: DateTime(2010),
    );
    if (pickedDate != null) {
      birthday = '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
      update();
    }
  }

  @override
  changegender(String selectgender) {
    gender = selectgender;
    update();
  }

  @override
  editprofile() {
    Get.back();
  }

  @override
  addImagefront() async {
    var imagePicked = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      File imagefile = File(imagePicked.path);
      if (await checkSizeImage(imagefile)) {
        var response = await sharedApiFunctionIm.uploadImage(imagefile);
        response.fold((error) => Get.snackbar("error", error), (imagemodel) {
          profileImageUrl = imagemodel.url;
          profileImageId = imagemodel.id.toString();
        });

        update();
      } else {
        showSizeWarning();
      }
    }
  }

  addImageback() async {
    var imagePicked = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      File imagefile = File(imagePicked.path);
      if (await checkSizeImage(imagefile)) {
        var response = await sharedApiFunctionIm.uploadImage(imagefile);
        response.fold((error) => Get.snackbar("error", error), (imagemodel) {
          backgroundImageUrl = imagemodel.url;
          backgroundImageId = imagemodel.id.toString();
        });

        update();
      } else {
        showSizeWarning();
      }
    }
  }

  @override
  removeItemForList(int index, List list) {
    list.removeAt(index);
    update();
  }
}
