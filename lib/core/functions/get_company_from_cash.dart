import 'dart:convert';

import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:get/get.dart';

Map<String, dynamic>? getCompanyfromCash() {
  MyServices myServices = Get.find();
  Map<String, dynamic>? company;

  String? json = myServices.sharedpref.getString(KeyShardpref.companyJson);
  if (json != null) {
    company = jsonDecode(json);
  }

  return company;
}
