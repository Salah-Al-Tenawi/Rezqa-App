import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/repository/user_repository.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:get/get.dart';

abstract class RePasswordController extends GetxController {
  late TextEditingController newpassword;
  late TextEditingController renewpassword;
  late GlobalKey<FormState> formkey;
  late String otp;
  late String email;
  late UserRepositry userRepositry;
  changepassowrd();
}

class RePasswordControllerIm extends RePasswordController {
  @override
  changepassowrd() async {
    var formstate = formkey.currentState;
    if (formstate!.validate()) {
      final response = await userRepositry.resetpassword(
          email, newpassword.text, renewpassword.text, otp);
      response.fold(
          (error) => Get.snackbar("error", error),
          (sucsses) => {
                Get.snackbar("sucsses", sucsses[ApiKey.massage]),
                Get.offAllNamed(MyRoute.login),
              });
    }
  }

  @override
  void onInit() {
    newpassword = TextEditingController();
    renewpassword = TextEditingController();
    formkey = GlobalKey<FormState>();
    otp = Get.arguments['otp'];
    email = Get.arguments['email'];
    userRepositry = Get.arguments['userRepositry'];

    super.onInit();
  }
}
