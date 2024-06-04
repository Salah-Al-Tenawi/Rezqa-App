import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FreeProfileController extends GetxController {
  editprofile();
  addImagefront();
  selectbirthday(BuildContext context);
  changegender(String selectgender);
}

class FreeProfileControllerIm extends FreeProfileController {
  late GlobalKey<FormState> formkey;
  late TextEditingController headline;
  late TextEditingController aboutme;
  late TextEditingController namejop;
  late TextEditingController joptitle;
  late TextEditingController location;
  List<String> skilles = ["java ", "c++ ", "Css "," Html ","Prolog" ,"Flutter" , "php "];
  String birthday = "xxxx/xx/xx   ";
  String gender = "male";
  File? imageback;
  File? imagefront;

  @override
  void onInit() {
    formkey = GlobalKey<FormState>();
    headline = TextEditingController();
    aboutme = TextEditingController();
    namejop = TextEditingController();
    joptitle = TextEditingController();
    location = TextEditingController();

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
    // TODO: implement editprofile
    throw UnimplementedError();
  }

  @override
  addImagefront() {
    // TODO: implement addImagefront
    throw UnimplementedError();
  }
}
