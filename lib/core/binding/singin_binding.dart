import 'package:freelanc/features/auth/sing_in_user/controller/singin_controller.dart';
import 'package:get/get.dart';

class SinginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SinginControllerIm());
  }
}
