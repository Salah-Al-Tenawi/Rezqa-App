// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/functions/input_valid.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/custom_text_form.dart';

import 'package:freelanc/features/freelancer/profile/controller/freelancer_profile_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

// ignore: must_be_immutable
class PortFolioFreeLnacer extends StatelessWidget {
  FreeProfileControllerIm controllerIm;
  PortFolioFreeLnacer({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 20.h, left: 200.w),
              child: Text(
                "معرض الأعمال",
                style: fontBlacksize22bold,
              )),
          CustomTextformfild(
              title: "عنوان العمل",
              validator: (val) {
                inputvaild(val!, "username", 40, 10);
              }),
          CustomTextformfild(
              title: "رابط العمل على أحد المنصات ",
              validator: (val) {
                inputvaild(val!, "url", 40, 10);
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "اختر ميلادك",
                style: font16blacknormal,
              ),
              InkWell(
                onTap: () {
                  // controllerIm.selectbirthday(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.date_range_outlined,
                      color: MyColors.blackColor,
                      size: 27.sp,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GetBuilder<FreeProfileControllerIm>(builder: (_) {
                      return Text(controllerIm.birthday);
                    })
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
