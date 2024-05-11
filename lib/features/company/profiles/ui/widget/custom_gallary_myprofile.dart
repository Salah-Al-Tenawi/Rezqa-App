// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/features/company/profiles/controller/_info_comapny_profile_controller.dart';

// ignore: must_be_immutable
class CustomGallaryprofile extends StatelessWidget {
  CompanyProfileControllerIm controllerIm;
  CustomGallaryprofile({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(children: [
        Text(
          "   معرض الشـركة :                         ",
          style: font23boldblack,
          textAlign: TextAlign.start,
        ),
        Text(
          " يمكنك إضافة صور لشركتـك لجذب انتباه الآخرين",
          style: TextStyle(fontSize: 15, color: MyColors.blackColor),
          textAlign: TextAlign.start,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            child: Icon(
              Icons.add_a_photo,
              size: 40.sp,
            ),
            height: 200.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            decoration: BoxDecoration(
                color: MyColors.greyColor,
                border: Border.all(color: MyColors.blueColor)),
          ),
        ),
      ]),
    );
  }
}
