// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/functions/input_valid.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/custom_text_form.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/company/profiles/controller/_info_comapny_profile_controller.dart';

// ignore: must_be_immutable
class CustomFormInfoProfileOne extends StatelessWidget {
  CompanyProfileControllerIm controller;
  CustomFormInfoProfileOne({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.keyformone,
        child: Padding(
          padding: EdgeInsets.only(
            top: 70.h,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 170.w,
                ),
                child: Text(
                  "معلومات الشركة  ",
                  style: fontBlacksize22bold,
                ),
              ),
              CustomTextformfild(
                //To do vaild user in arabic
                validator: (val) => inputvaild(val!, "username", 30, 2),
                title: "اسم الشركة",
                controller: controller.name,
                icon: const Icon(Icons.near_me_outlined),
                keyboardType: TextInputType.name,
              ),
              CustomTextformfild(
                // to do vaild City
                validator: (val) => inputvaild(val!, "username", 30, 2),
                title: "المدينة",
                controller: controller.state,
                icon: const Icon(Icons.location_city_outlined),
              ),
              CustomTextformfild(
                validator: (val) => inputvaild(val!, "username", 30, 2),
                title: "المنطقة",
                controller: controller.location,
                icon: const Icon(Icons.location_searching),
              ),
              CustomTextformfild(
                validator: (val) => inputvaild(val!, "username", 200, 10),
                title: "وصف الشركة",
                controller: controller.descrption,
                icon: const Icon(Icons.add_reaction),
               
              ),
              Padding(
                padding: EdgeInsets.only(top: 70.h, left: 120.w),
                child: MyButton(
                  width: 110.w,
                  height: 40.h,
                  borderRadius: true,
                  color: MyColors.blueColor,
                  onPressed: () {
                    controller.nextpage();
                  },
                  child: Text(
                    "التالي",
                    style: font15greyebold,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
