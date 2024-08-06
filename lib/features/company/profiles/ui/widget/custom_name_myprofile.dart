// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/features/company/profiles/controller/_info_comapny_profile_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomNameprofile extends StatelessWidget {
  CompanyProfileControllerIm controllerIm;
  CustomNameprofile({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: GetBuilder<CompanyProfileControllerIm>(builder: (_) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   width: 30.w,
              // ),
              Icon(
                Icons.warning_rounded,
                color: Colors.red,
                size: 20.sp,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "غير موثق",
                style: TextStyle(
                    color: MyColors.greyTextColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            controllerIm.name.text,
            style: font25boldblack,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
            child:
                Text(textAlign: TextAlign.center, controllerIm.descrption.text),
          ),
          Divider(
            color: MyColors.greyColor,
            indent: 60,
            endIndent: 60,
          ),
        ],
      );
    }));
  }
}
