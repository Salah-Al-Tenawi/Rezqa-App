// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_profile_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomNameprofileFree extends StatelessWidget {
  FreeProfileControllerIm controllerIm;
  CustomNameprofileFree({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          GetBuilder<FreeProfileControllerIm>(builder: (_) {
            return Text(
              controllerIm.username,
              style: font25boldblack,
            );
          }),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
            child:
                Text(textAlign: TextAlign.center, controllerIm.headline.text),
          ),
          Divider(
            color: MyColors.greyColor,
            indent: 60,
            endIndent: 60,
          ),
        ],
      ),
    );
  }
}
