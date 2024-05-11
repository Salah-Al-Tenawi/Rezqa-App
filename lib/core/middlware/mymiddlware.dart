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
      if (myServices.sharedpref.getBool(KeyShardpref.iscompany) == true) {
        return RouteSettings(name: MyRoute.dashbordcompany);
      }
      if (myServices.sharedpref.getBool(KeyShardpref.iscustomer) == true) {
        // return RouteSettings(name: MyRoute.dashbordcustomer);
      }
      if (myServices.sharedpref.getBool(KeyShardpref.isfreelancer) == true) {
        // return RouteSettings(name: MyRoute.dashbordfreelane);
      }
    }

    if (myServices.sharedpref.getBool(KeyShardpref.onboardingisShowtrue) ==
        true) {
      return const RouteSettings(name: MyRoute.login);
    }

    return null;
  }
}
