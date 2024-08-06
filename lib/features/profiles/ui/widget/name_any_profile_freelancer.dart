// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/features/profiles/controller/any_profile_controlelr.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class NameAnyprofileFree extends StatelessWidget {
  AnyProfileControllerIm controllerIm;
  NameAnyprofileFree({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          GetBuilder<AnyProfileControllerIm>(builder: (_) {
            return Text(
              controllerIm.freelancerModel!.username,
              style: font25boldblack,
            );
          }),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
            child:
                Text(textAlign: TextAlign.center, controllerIm.freelancerModel!.headline),
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
