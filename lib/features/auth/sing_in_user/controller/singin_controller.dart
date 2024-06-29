import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/repository/user_repository.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/features/auth/models/user_model.dart';
import 'package:get/get.dart';

abstract class SinginController extends GetxController {
  late GlobalKey<FormState> formkeysing;
  late TextEditingController fistname;
  late TextEditingController lastname;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController configpassword;
  late MyServices myServices;
  late UserRepositry userrepositry;
  RxBool circle = false.obs;

  UserModel? user;

  sigin();
  siginwithGoogle();
  gotologin();
}

class SinginControllerIm extends SinginController {
  @override
  gotologin() {
    Get.back();
  }

  @override
  sigin() async {
    var fomrstate = formkeysing.currentState;

    if (fomrstate!.validate()) {
      circle.value = true;
      final response = await userrepositry.sigin(fistname.text, lastname.text,
          email.text, password.text, configpassword.text);

      response.fold((error) {
        circle.value = false;
        Get.snackbar("errore", error);
      }, (usermodel) {
        circle.value = false;
        String username = usermodel.firstname! + usermodel.lastname!;
        
        myServices.sharedpref.setString(KeyShardpref.username, username);
        Get.offAllNamed(MyRoute.verfiyemilsing, arguments: email.text);
      });
    }
  }

  @override
  siginwithGoogle() {}

  @override
  void onInit() {
    myServices = Get.find();
    userrepositry = Get.find();
    formkeysing = GlobalKey<FormState>();
    fistname = TextEditingController();
    lastname = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    configpassword = TextEditingController();

    super.onInit();
  }
}
