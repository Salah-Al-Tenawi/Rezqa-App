// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/features/client/profile/controller/info_client_profile_controller.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_profile_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

// ignore: must_be_immutable
class MoreINfoProfileFreelancer extends StatelessWidget {
  FreeProfileControllerIm controller;
  MoreINfoProfileFreelancer({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 170.w, bottom: 17.h),
            child: Text(
              "معلومات إضافية",
              style: fontBlacksize22bold,
            ),
          ),
          GetBuilder<FreeProfileControllerIm>(builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "اختر جنسك",
                  style: font16blacknormal,
                ),
                SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      const Text("ذكر  "),
                      Icon(
                        Icons.person_4,
                        color: MyColors.blackColor,
                      ),
                      Radio(
                          value: "male",
                          groupValue: controller.gender,
                          onChanged: (selectgender) {
                            controller.changegender(selectgender!);
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      const Text("أنثى "),
                      const Icon(Icons.person_2),
                      Radio(
                          value: "female",
                          groupValue: controller.gender,
                          onChanged: (selectgender) {
                            controller.changegender(selectgender!);
                          }),
                    ],
                  ),
                ),
              ],
            );
          }),
          SizedBox(
            height: 34.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "اختر ميلادك",
                style: font16blacknormal,
              ),
              InkWell(
                onTap: () {
                  controller.selectbirthday(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.cake_sharp,
                      color: MyColors.blackColor,
                      size: 27.sp,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GetBuilder<FreeProfileControllerIm>(builder: (_) {
                      return Text(controller.birthday);
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
