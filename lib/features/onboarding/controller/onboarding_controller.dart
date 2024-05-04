import 'package:flutter/cupertino.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  MyServices myServices = Get.find();
  next();
  skip();
  go();
  onchanged(int index);
}

class OnboardingControllerImp extends OnboardingController {
  late int cruntpage;
  late PageController pageController;

  @override
  next() {
    cruntpage++;
    pageController.animateToPage(cruntpage,
        duration: const Duration(milliseconds: 900), curve: Curves.easeOut);

    update();
  }

  @override
  onchanged(int index) {
    cruntpage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    cruntpage = 0;

    super.onInit();
  }

  @override
  skip() {
    myServices.sharedpref.setBool(KeyShardpref.onboardingisShowtrue, true);

    Get.offNamed(MyRoute.login);
  }

  @override
  go() {
    myServices.sharedpref.setBool(KeyShardpref.onboardingisShowtrue, true);
    Get.offNamed(MyRoute.login);
  }
}
