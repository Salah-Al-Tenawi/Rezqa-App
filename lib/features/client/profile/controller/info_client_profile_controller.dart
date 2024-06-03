import 'dart:io';
import 'package:flutter/material.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class ClientProfileController extends GetxController {
  gotoverfiyprofile();
  selectbirthday(BuildContext context);
  picedImage(String imageforWhat);
  changegender(String selectgender);
  //this method for send one image as file to database and return url this image
  uploadImage(File image);
  saveprofile();
  editprofile();
}

class ClientProfileControllerIm extends ClientProfileController {
  late TextEditingController name;
  late TextEditingController joptitle;
  late TextEditingController city;
  String birthday = "xxxx/xx/xx   ";
  String gender = "male";
  File? imagefront;
  File? imageback;
  late ImagePicker imagePicker;
  late GlobalKey<FormState> formkey;

  @override
  void onInit() {
    name = TextEditingController();
    joptitle = TextEditingController();
    city = TextEditingController();
    imagePicker = ImagePicker();
    formkey = GlobalKey<FormState>();
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
  picedImage(String imageforWhat) async {
    var imagePicked = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      switch (imageforWhat) {
        case "front":
          imagefront = File(imagePicked.path);
          update();
          break;
        case "back":
          imageback = File(imagePicked.path);
          update();
      }
    }
  }

  @override
  gotoverfiyprofile() {
    if (formkey.currentState!.validate()) {
      Get.toNamed(MyRoute.verfiymyprofileclient);
    }
  }

  @override
  editprofile() {
    Get.back();
  }

  @override
  saveprofile() {
    // TODO: implement saveprofile
    throw UnimplementedError();
  }

  @override
  uploadImage(File image) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }

  @override
  changegender(String selectgender) {
    gender = selectgender;
    update();
  }
}
