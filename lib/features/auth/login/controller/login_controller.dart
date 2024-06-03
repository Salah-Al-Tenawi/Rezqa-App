import 'package:flutter/cupertino.dart';

import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/api/dio_consumer.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/repository/user_repository.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/features/auth/sing_in_witg_google.dart/google_singin_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

abstract class LoginController extends GetxController {
  // ignore: prefer_final_fields
  SinginGoogleController _singinGoogleController =
      Get.put(SinginGoogleController());
  late TextEditingController email;
  late TextEditingController password;
  late GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool showpassword = true;

  late MyServices myServices;
  late UserRepositry userRepositry;
  String? tokenuser;

  RxBool isloading = false.obs;
  login();
  gotoforgetpassord();
  gotosingup();
  showpassord();
  loginwithgoogle();
}

class LoginControllerIm extends LoginController {
  @override
  gotoforgetpassord() {
    Get.toNamed(MyRoute.forgetpassword, arguments: userRepositry);
  }

  @override
  gotosingup() {
    Get.toNamed(MyRoute.singin);
  }

  @override
  login() async {
    var formstate = formkey.currentState;

    if (formstate!.validate()) {
      // isloading = true.obs;
      final response = await userRepositry.login(email.text, password.text);
      response.fold((error) {
        // isloading = false.obs;
        Get.snackbar("error", error);
      }, (response) {
        UserRepositry.token = response[ApiKey.token];

        if (UserRepositry.token != null) {
          myServices.sharedpref
              .setString(KeyShardpref.token, UserRepositry.token!);
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

    myServices = Get.find();
    myServices.sharedpref.clear();
    // api = Get.find();
    userRepositry = Get.put(UserRepositry());
    print(
        "UserRepositry.token===============================${UserRepositry.token}");
    print("user==================================${UserRepositry.user}");
    super.onInit();
  }

  @override
  showpassord() {
    showpassword = showpassword == false ? true : false;
    update();
  }

  @override
  loginwithgoogle() {
    _singinGoogleController.login();
  }
}
