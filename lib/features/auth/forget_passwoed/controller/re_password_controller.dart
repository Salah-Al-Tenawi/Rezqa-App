import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:get/get.dart';

abstract class RePasswordController extends GetxController {
  late TextEditingController newpassword;
  late TextEditingController renewpassword;
  late GlobalKey<FormState> formkey;
  changepassowrd();
}

class RePasswordControllerIm extends RePasswordController {
  @override
  changepassowrd() {
    var formstate = formkey.currentState;
    if (formstate!.validate()) {
      print('sucsses input ');
      Get.offAllNamed(MyRoute.login);
    }
  }

  @override
  void onInit() {
    newpassword = TextEditingController();
    renewpassword = TextEditingController();
    formkey = GlobalKey<FormState>();
    super.onInit();
  }
}
