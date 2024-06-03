import 'package:flutter/material.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:get/get.dart';

class Mymiddlware extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    print(myServices.sharedpref.getString(KeyShardpref.token));

    if (myServices.sharedpref.getString(KeyShardpref.token) != null) {
      // switch 
          }

    if (myServices.sharedpref.getBool(KeyShardpref.onboardingisShowtrue) ==
        true) {
      return const RouteSettings(name: MyRoute.login);
    }

    return null;
  }
}
