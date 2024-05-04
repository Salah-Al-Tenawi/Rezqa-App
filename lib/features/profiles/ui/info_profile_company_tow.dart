// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/features/profiles/ui/widget/custom_form_tow.dart';
import 'package:get/get.dart';

import 'package:freelanc/features/profiles/controller/_info_comapny_profile_controller.dart';
import 'package:freelanc/features/profiles/ui/widget/style_profile.dart';

// ignore: must_be_immutable
class InfoProfileComapnyTow extends StatelessWidget {
  const InfoProfileComapnyTow({
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
            CustomFormInfoPrpfileCompanyTow(controller: controller),
           
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
