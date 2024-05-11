import 'package:freelanc/core/route/app_routes.dart';
import 'package:freelanc/core/api/dio_consumer.dart';
import 'package:freelanc/core/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedpref;

  Future<MyServices> init() async {
    sharedpref = await SharedPreferences.getInstance();

    return this;
  }
}

initalservices() async {
  await Get.putAsync(() => MyServices().init());
  Get.put(DioConSumer());
  Get.put(AppRoute());
  Get.lazyPut(() => UserRepositry(),fenix: true);
}
