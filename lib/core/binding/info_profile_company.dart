import 'package:freelanc/features/profiles/controller/_info_comapny_profile_controller.dart';
import 'package:get/get.dart' show Bindings, Get, Inst;

class InfopProfilecompanyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CompanyProfileControllerIm());
  }
}
