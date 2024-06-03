import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FreeProfileController extends GetxController {
  editprofile();
  addImagefront();
}

class FreeProfileControllerIm extends FreeProfileController {
  late TextEditingController headline;
  late TextEditingController aboutme;
  late TextEditingController namejop;
  late TextEditingController joptitle;
  late TextEditingController location;
  List<String> skilles=[];
  String birthday = "xxxx/xx/xx   ";
  String gender = "male";
  File? imageback;
  File? imagefront;

  @override
  void onInit() {
    headline = TextEditingController();
    aboutme = TextEditingController();
    namejop = TextEditingController();
    joptitle = TextEditingController();
    location = TextEditingController();

    super.onInit();
  }

  @override
  editprofile() {
    // TODO: implement editprofile
    throw UnimplementedError();
  }

  @override
  addImagefront() {
    // TODO: implement addImagefront
    throw UnimplementedError();
  }
}
