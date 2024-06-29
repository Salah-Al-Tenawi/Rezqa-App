import 'package:freelanc/core/route/routes.dart';
import 'package:get/get.dart';

abstract class ChoseTypeUserController extends GetxController {
  gotocomapnyinfo();
  gotofreelancerinfo();
  gotoclientinfo();
}

class ChoseTypeUserControllerIm extends ChoseTypeUserController {
  @override
  gotocomapnyinfo() {
    Get.toNamed(MyRoute.infoprofilecompany);
  }

  @override
  gotoclientinfo() {
    Get.toNamed(MyRoute.infoprofileclient);
  }

  @override
  gotofreelancerinfo() {
    // TODO: implement gotofreelancerinfo
    throw UnimplementedError();
  }
}
