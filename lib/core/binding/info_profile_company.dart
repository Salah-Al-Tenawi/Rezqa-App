import 'package:freelanc/features/company/profiles/controller/_info_comapny_profile_controller.dart';
import 'package:get/get.dart' ;

class InfopProfilecompanyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CompanyProfileControllerIm(), permanent: true);
  }
}
