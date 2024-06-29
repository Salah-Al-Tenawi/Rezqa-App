import 'package:freelanc/core/route/routes.dart';
import 'package:get/get.dart';

gotoDashbord(String roleuser) {
  switch (roleuser) {
    case "company":
      Get.offAllNamed(MyRoute.dashbordcompany);
    case "freelancer":
      Get.offAllNamed(MyRoute.dashBoardFreelancer);
    case "client":
      Get.offAllNamed(MyRoute.dashBoardClint);
  }
}
