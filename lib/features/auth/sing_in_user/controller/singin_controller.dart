import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  bool circle = false;

  UserModel? user;

  sigin();
  siginwithGoogle();
  gotologin();
}

class SinginControllerIm extends SinginController {
  @override
  gotologin() {
    Get.offNamed(MyRoute.login);
  }

  @override
  sigin() async {
    var fomrstate = formkeysing.currentState;

    if (fomrstate!.validate()) {
      final response = await userrepositry.sigin(fistname.text, lastname.text,
          email.text, password.text, configpassword.text);

      response.fold(
          (error) => Get.snackbar("errore", error),
          (response) => {
                Get.offAllNamed(MyRoute.verfiyemilsing, arguments: email.text),
                user = response
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
