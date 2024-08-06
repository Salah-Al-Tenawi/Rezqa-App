import 'package:freelanc/core/route/routes.dart';
import 'package:get/get.dart';

abstract class DrawerFreelancerController extends GetxController {
  
  gotoMyprofile();
}

class DrawerFreelancerControllerIM extends DrawerFreelancerController {
  @override
  gotoMyprofile() {

    Get.toNamed(MyRoute.infoprofileFreelancer);
  }
}
