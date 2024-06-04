import 'package:freelanc/features/freelancer/profile/controller/freelancer_profile_controller.dart';
import 'package:get/get.dart' ;

class InfopProfileFreelancerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FreeProfileControllerIm(), permanent: true);
  }
}
