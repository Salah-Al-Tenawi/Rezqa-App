import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/repository/user_repository.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:get/get.dart';

abstract class VerfiyEmailController extends GetxController {
  verfiyemailandlogin(String email, String otp);
  resendcode();
  gosucsse();
}

class VerfiyEmailControllerIm extends VerfiyEmailController {
  late UserRepositry userrepositry;
  late MyServices myServices;
  late String email;
  String? otp;
  RxBool isloading = false.obs;

  @override
  verfiyemailandlogin(String email, String otp) async {
    isloading.value = true;
    final response = await userrepositry.verfiyemail(email, otp);
    response.fold((error) {
      isloading.value = false;
      Get.snackbar("error", error);
    }, (token) {
      isloading.value = false;
      UserRepositry.token = token[ApiKey.token];
      print(
          "token=======================================${UserRepositry.token}");
      if (UserRepositry.token != null) {
        Get.offAllNamed(MyRoute.sucsses);
        myServices.sharedpref
            .setString(KeyShardpref.token, UserRepositry.token!);
      } else {
        Get.snackbar("خطأ", "حاول مجددا");
      }
    });
  }

  @override
  resendcode() async {
    isloading.value = true;
    final response = await userrepositry.resendotp(email);
    response.fold((error) {
      isloading.value = false;
      Get.snackbar("فشل", "حاول مجددا");
    }, (succses) {
      isloading.value = false;
      Get.snackbar("نجاح", "تم اعادة إرسال رمز التحقق مرة آخرى");
    });
  }

  @override
  gosucsse() {
    Get.offAllNamed(MyRoute.chosetypeuser);
    myServices.sharedpref.setBool(KeyShardpref.singintrue, true);
  }

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments as String;
    userrepositry = Get.find();
    myServices = Get.find();
    myServices = Get.find();
  }
}
