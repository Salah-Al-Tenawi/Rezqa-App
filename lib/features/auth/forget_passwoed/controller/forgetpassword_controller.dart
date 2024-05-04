import 'package:flutter/material.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/repository/user_repository.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:get/get.dart';

abstract class ForgetpasswordController extends GetxController {
  late TextEditingController email;
  String? otp;
  late GlobalKey<FormState> formkey;
  late UserRepositry userRepositry;
  late MyServices myServices;
  gotoverfiyemil();
  verfiyemail();
  restcode();
}

class ForgetpasswordControllerIm extends ForgetpasswordController {
  @override
  gotoverfiyemil() async {
    var formstate = formkey.currentState;
    if (formstate!.validate()) {
      final response = await userRepositry.forgetpassword(email.text);
      response.fold((error) => Get.snackbar("error", error), (sucsses) {
        Get.snackbar("sucsses", sucsses[ApiKey.massage]);
        Get.toNamed(
          MyRoute.forgetverfiyemail,
        );
      });
    }
  }

  @override
  verfiyemail() async {
    final response = await userRepositry.verfiyemail(email.text, otp!);
    response.fold((error) => Get.snackbar("erroe", error), (token) {
      token[ApiKey.token];
      print(
          "token=======================================${token[ApiKey.token]}");
      if (token[ApiKey.token] != null) {
        Get.offAllNamed(MyRoute.rePassword);
        myServices.sharedpref
            .setString(KeyShardpref.token, token[ApiKey.token]!);
      } else {
        Get.snackbar("خطأ", "حاول مجددا");
      }
    });
  }

  @override
  restcode() {}

  @override
  void onInit() {
    userRepositry = Get.arguments as UserRepositry;
    email = TextEditingController();
    myServices = Get.find();
    formkey = GlobalKey<FormState>();

    super.onInit();
  }
}
