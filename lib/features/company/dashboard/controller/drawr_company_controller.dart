import 'package:flutter/material.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/functions/input_valid.dart';
import 'package:freelanc/core/repository/profiles/profile_company_repo.dart';
import 'package:freelanc/core/repository/user_repository.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/custom_text_form.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:get/get.dart';

abstract class DrawerCompanyControlller extends GetxController {
  shwoCompany();
  showDialogToDeletMyCompany();
  deletMyCompany(String password);

  logout();
  int? idcompany;
}

class DrawerCompanyControllerIm extends DrawerCompanyControlller {
  late TextEditingController password;
  late GlobalKey<FormState> keypassowrd;
  late MyServices myServices;
  UserRepositry userRepositry = Get.put(UserRepositry());
  late CompanyprofileRepoIm companyprofileRepoIm;

  @override
  void onInit() {
    keypassowrd = GlobalKey<FormState>();
    password = TextEditingController();
    userRepositry = Get.put(UserRepositry());
    companyprofileRepoIm = Get.put(CompanyprofileRepoIm());
    myServices = Get.find();

    idcompany = myServices.sharedpref.getInt(KeyShardpref.id);

    super.onInit();
  }

  @override
  shwoCompany() async {
    Get.toNamed(MyRoute.verfiymyprofilecompany);
    // final response = await companyprofileRepoIm.showcompany(id);

    // response.fold((error) => {Get.snackbar("error", error)}, (companymodel) {

    // });
  }

  @override
  showDialogToDeletMyCompany() {
    Get.defaultDialog(
        title: "تأكيد الهوية",
        actions: [
          MyButton(
              onPressed: () {
                var fomrstate = keypassowrd.currentState;
                if (fomrstate!.validate()) {
                  deletMyCompany(password.text);
                }
              },
              borderRadius: true,
              color: MyColors.blueColor,
              child: Text(
                "تأكيد",
                style: font14greynormal,
              )),
          MyButton(
            onPressed: () {
              Get.isDialogOpen == true ? Get.back() : null;
            },
            borderRadius: true,
            color: MyColors.blueColor,
            child: Text(
              "إلغاء",
              style: font14greynormal,
            ),
          )
        ],
        content: Form(
          key: keypassowrd,
          child: CustomTextformfild(
              controller: password,
              icon: Icon(
                Icons.security,
                color: MyColors.blueColor,
              ),
              title: "كلمة المرور",
              validator: (val) => inputvaild(val!, "password", 25, 7)),
        ));
  }

  @override
  logout() async {
    final response = await userRepositry.logout();
    response.fold((error) {
      Get.snackbar("error", error);
    }, (sucses) {
      myServices.sharedpref.clear();
      myServices.sharedpref.setBool(KeyShardpref.onboardingisShowtrue, true);
      Get.offAllNamed(MyRoute.login);
    });
  }

  @override
  deletMyCompany(String password) async {
    final response = await companyprofileRepoIm.deletcompany(password);
    response.fold((error) {
      Get.snackbar("error", error);
    }, (sucsse) {
      Get.offAllNamed(MyRoute.login);
      myServices.sharedpref.clear();
      myServices.sharedpref.setBool(KeyShardpref.onboardingisShowtrue, true);
    });
  }
}
