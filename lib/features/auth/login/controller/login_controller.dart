import 'package:flutter/cupertino.dart';

import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/functions/go_to_dashboard.dart';
import 'package:freelanc/core/repository/user_repository.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/features/auth/sing_in_witg_google.dart/google_singin_controller.dart';
import 'package:get/get.dart';

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
      isloading.value = true;
      final response = await userRepositry.login(email.text, password.text);
      response.fold((error) {
        if (error == "you need to verify your email") {
          Get.toNamed(MyRoute.verfiyemilsing, arguments: email.text);
        }
        isloading.value = false;
        Get.snackbar("error", error);
      }, (usermoder) {
        if (usermoder.token != null) {
          myServices.sharedpref.setString(KeyShardpref.token, usermoder.token!);
          myServices.sharedpref
              .setString(KeyShardpref.roleuser, usermoder.role!);
          myServices.sharedpref.setInt(KeyShardpref.roleID, usermoder.roleId!);
          gotoDashbord();
          Get.snackbar("أهلا بالعودة                 ", "");
          print(
              myServices.sharedpref.getBool(KeyShardpref.onboardingisShowtrue));
        } else {
          print(" you don't have token");
        }
      });
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();

    myServices = Get.find();
    // myServices.sharedpref.clear();
    // api = Get.find();
    print(myServices.sharedpref.getString(KeyShardpref.roleuser));
    userRepositry = Get.put(UserRepositry());

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
