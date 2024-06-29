// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/company/profiles/controller/_info_comapny_profile_controller.dart';
import 'package:freelanc/features/company/profiles/ui/widget/form_info_profile.dart';
import 'package:freelanc/features/company/profiles/ui/widget/style_profile.dart';
import 'package:get/get.dart';

class InfoProfileCompany extends StatelessWidget {
  const InfoProfileCompany({
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
            CustomFormInfoProfile(controller: controller),
          
            
              Padding(
                padding: EdgeInsets.only(top: 70.h, left: 120.w),
                child: MyButton(
                  width: 110.w,
                  height: 40.h,
                  borderRadius: true,
                  color: MyColors.blueColor,
                  onPressed: () {
                    controller.goprofile();
                  },
                  child: Text(
                    "التالي",
                    style: font15greyebold,
                  ),
                ),
              ),
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
