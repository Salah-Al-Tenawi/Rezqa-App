import 'package:freelanc/features/client/profile/controller/info_client_profile_controller.dart';
import 'package:get/get.dart';


class InfopProfileclientBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ClientProfileControllerIm(), permanent: true);
  }
}