import 'package:flutter/cupertino.dart';

import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/api/dio_consumer.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/repository/user_repository.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  late GlobalKey<FormState> formkey;
  bool showpassword = true;
  late DioConSumer api;
  late MyServices myServices;
  late UserRepositry userRepositry;
  String? tokenuser;

  login();
  gotoforgetpassord();
  gotosingup();
  showpassord();
}

class LoginControllerIm extends LoginController {
  @override
  gotoforgetpassord() {
    Get.toNamed(MyRoute.forgetpassword,arguments: userRepositry);
  }

  @override
  gotosingup() {
    Get.toNamed(MyRoute.singin);
  }

  @override
  login() async {
    var formstate = formkey.currentState;

    if (formstate!.validate()) {
      final response = await userRepositry.login(email.text, password.text);
      response.fold((error) => Get.snackbar("error", error), (response) {
        tokenuser = response[ApiKey.token];
        print("token==================================$tokenuser");
        if (tokenuser != null) {
          myServices.sharedpref.setString(KeyShardpref.token, tokenuser!);
          Get.snackbar("أهلا بالعودة                 ", "");
          Get.offAllNamed(MyRoute.dashbordcompany);
        }
      });
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    formkey = GlobalKey<FormState>();
    myServices = Get.find();
    // myServices.sharedpref.clear();
    api = Get.find();
    userRepositry = Get.find();
    super.onInit();
  }

  @override
  showpassord() {
    showpassword = showpassword == false ? true : false;
    update();
  }
}
