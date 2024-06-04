// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/functions/input_valid.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';

import 'package:freelanc/core/widgets/custom_text_form.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/client/profile/controller/info_client_profile_controller.dart';
import 'package:freelanc/features/client/profile/ui/widget/more_info_profile_client.dart';

// ignore: must_be_immutable
class CustomFormProfileClient extends StatelessWidget {
  ClientProfileControllerIm controller;
  CustomFormProfileClient({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.formkey,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10.h,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 170.w, bottom: 20.h),
                child: Text(
                  "معلومات البروفايل",
                  style: fontBlacksize22bold,
                ),
              ),

              CustomTextformfild(
                validator: (val) => inputvaild(val!, "username", 30, 2),
                title: " المهنة أو العمل",
                controller: controller.joptitle,
                icon: Icon(
                  Icons.work,
                  color: MyColors.blackColor,
                ),
                keyboardType: TextInputType.name,
              ),
              CustomTextformfild(
                validator: (val) => inputvaild(val!, "username", 30, 2),
                title: "المدينة",
                controller: controller.city,
                icon: Icon(
                  Icons.location_city_outlined,
                  color: MyColors.blackColor,
                ),
              ),
              MoreInfoProfileClient(
                controller: controller,
              ),
              SizedBox(
                height: 50.h,
              ),

              MyButton(
                onPressed: () {
                  controller.gotoverfiyprofile();
                },
                color: MyColors.blueColor,
                borderRadius: true,
                width: 130.w,
                height: 50.h,
                child: Text(
                  "التالي",
                  style: font15greyebold,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),

              // Padding(
              //   padding: EdgeInsets.only(top: 70.h, left: 120.w),
              //   child: MyButton(
              //     width: 110.w,
              //     height: 40.h,
              //     borderRadius: true,
              //     color: MyColors.blueColor,
              //     onPressed: () {
              //       controller.nextpage();
              //     },
              //     child: Text(
              //       "التالي",
              //       style: font15greyebold,
              //     ),
              //   ),
              // ),
            ],
          ),
        ));
  }
}
