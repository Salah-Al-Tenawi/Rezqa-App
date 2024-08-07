import 'package:flutter/material.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/functions/input_valid.dart';
import 'package:freelanc/core/helper/shared_api_functions.dart';
import 'package:freelanc/core/repository/profiles/profile_company_repo.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/custom_text_form.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:get/get.dart';

abstract class MyDrawerAndAppbarController extends GetxController {
  final PageController pageController = PageController();
  GlobalKey<FormState> keypassowrd = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  SharedApiFunctionIm sharedApiFunctionIm = SharedApiFunctionIm();
  CompanyprofileRepoIm companyprofileRepoIm = Get.put(CompanyprofileRepoIm());
  MyServices myServices = Get.find();
  RxInt selectedPage = 1.obs;
  String? roleUser;

  jumpToPage(int index);
  myprofile();
  myOffers();
  deletCompany();
  logOut();
  gotoMynotifications();
  verFiyLogout();
  gotoMYchat();
  showDialogToDeletMyCompany();
  deletMyCompany(String password);
  
}

class MyDrawerAndAppbarControllerIm extends MyDrawerAndAppbarController {
  @override
  void onInit() {
    roleUser = myServices.sharedpref.getString(KeyShardpref.roleuser);

    super.onInit();
  }

  @override
  gotoMYchat() {
    // TODO: implement gotoMYchat
    throw UnimplementedError();
  }

  @override
  gotoMynotifications() {
    // TODO: implement gotoMynotifications
    throw UnimplementedError();
  }

  @override
  jumpToPage(int index) {
    selectedPage.value = index;
  }

  @override
  myprofile() async {
    switch (roleUser) {
      case "company":
        Get.toNamed(MyRoute.verfiymyprofilecompany);
      case "freelancer":
        Get.toNamed(MyRoute.verfiymyprofileFreelancer);
      case "client":
        Get.toNamed(MyRoute.myprofileclient);
    }
  }

  @override
  myOffers() {
    switch (roleUser) {
      case "company":
      // Get.toNamed(MyRoute.verfiymyprofilecompany);
      case "freelancer":
      // Get.toNamed(MyRoute.verfiymyprofileFreelancer);
      case "client":
      // Get.toNamed(MyRoute.myprofileclient);
    }
  }

  @override
  deletCompany() async {}

  @override
  logOut() async {
    final response = await sharedApiFunctionIm.logout();
    response.fold((error) => Get.snackbar("erorr", error), (succses) {
      Get.snackbar("نجاح", "نم تسجيل الخروج بنجاح");
      myServices.sharedpref.clear();
      myServices.sharedpref.setBool(KeyShardpref.onboardingisShowtrue, true);
      Get.offAllNamed(MyRoute.login);
    });
  }

  @override
  verFiyLogout() {
    Get.defaultDialog(
        title: "تسجيل خروج",
        content: Text("هل تريد تسجيل الخروج من حسابك"),
        actions: [
          MyButton(
              onPressed: () async {
                await logOut();
              },
              color: MyColors.blueColor,
              splashcolor: MyColors.blueColor,
              borderRadius: true,
              child: Text(
                "تأكيد",
                style: TextStyle(color: MyColors.greyColor),
              )),
          MyButton(
              onPressed: () {
                Get.back();
              },
              splashcolor: MyColors.blueColor,
              borderRadius: true,
              color: MyColors.greyColor,
              child: const Text("إلغاء")),
        ]);
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
  deletMyCompany(String password) async {
    final response = await companyprofileRepoIm.deletcompany(password);
    response.fold((error) {
      Get.snackbar("error", error);
    }, (sucsse) {
      myServices.sharedpref.clear();
      myServices.sharedpref.setBool(KeyShardpref.onboardingisShowtrue, true);
      Get.offAllNamed(MyRoute.login);
    });
  }
  
}
