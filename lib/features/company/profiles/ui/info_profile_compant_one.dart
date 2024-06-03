// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:freelanc/features/company/profiles/controller/_info_comapny_profile_controller.dart';
import 'package:freelanc/features/company/profiles/ui/widget/custom_form_one.dart';
import 'package:freelanc/features/company/profiles/ui/widget/style_profile.dart';
import 'package:get/get.dart';

class InfoProfileCompanyOne extends StatelessWidget {
  const InfoProfileCompanyOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CompanyProfileControllerIm controller = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            StyleInfoProfile(
              alignment: Alignment.topRight,
              cricularbottmleft: true,
            ),
            CustomFormInfoProfileOne(controller: controller),
            StyleInfoProfile(
              alignment: Alignment.bottomLeft,
              criculartopright: true,
            ),
          ],
        ),
      ),
    );
  }
}
