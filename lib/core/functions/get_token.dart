import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:get/get.dart';

Future<String?> getToken() async {
  MyServices myServices = Get.find();
  String? token = myServices.sharedpref.getString(KeyShardpref.token);
  print("token==============================${token}");
  return "Bearer $token";
}

Future savetoken(String token) async {
  MyServices myServices = Get.find();
  myServices.sharedpref.setString(ApiKey.token, token);
}
