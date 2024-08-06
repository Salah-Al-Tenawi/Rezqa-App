import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:get/get.dart';

// MyServices myServices = Get.find();
gotoDashbord() {
  MyServices myServices = Get.find();
  String? roleuser = myServices.sharedpref.getString(KeyShardpref.roleuser);
  switch (roleuser) {
    case "":
      Get.offAllNamed(MyRoute.chosetypeuser);
    case "company":
      Get.offAllNamed(MyRoute.dashbord);
    case "freelancer":
      Get.offAllNamed(MyRoute.dashBoardFreelancer);
    case "client":
      Get.offAllNamed(MyRoute.dashBoardClint);
  }
}
