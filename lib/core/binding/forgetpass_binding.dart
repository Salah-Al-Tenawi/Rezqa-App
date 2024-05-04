import 'package:freelanc/features/auth/forget_passwoed/controller/forgetpassword_controller.dart';
import 'package:get/get.dart';

class ForgetpasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ForgetpasswordControllerIm(),
    );
  }
}
