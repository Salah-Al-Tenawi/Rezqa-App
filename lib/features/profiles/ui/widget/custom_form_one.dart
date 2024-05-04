// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/functions/input_valid.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/custom_text_form.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/profiles/controller/_info_comapny_profile_controller.dart';
import 'package:get/get.dart';

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
        key: controller.keyforone,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20.h,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Text(
                    "معلومات الشركة  ",
                    style: fontBlacksize22bold,
                  ),
                ),
              ),
              CustomTextformfild(
                validator: (val) => inputvaild(val!, "username", 30, 5),
                title: "اسم الشركة",
                controller: controller.namecompany,
                icon: const Icon(Icons.near_me),
                keyboardType: TextInputType.name,
              ),
              CustomTextformfild(
                validator: (val) => inputvaild(val!, "username", 30, 5),
                title: "المدينة",
                controller: controller.addresCity,
                icon: const Icon(Icons.add_reaction),
              ),
              CustomTextformfild(
                validator: (val) => inputvaild(val!, "username", 30, 5),
                title: "المنطقة",
                controller: controller.addresCountry,
                icon: const Icon(Icons.add_reaction),
              ),
              CustomTextformfild(
                validator: (val) => inputvaild(val!, "email", 30, 5),
                title: "تفاصيل الشركة",
                controller: controller.descreptioncompany,
                icon: const Icon(Icons.add_reaction),
              ),
              const Text(" . . ."),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 30.w, top: 50.h),
                  child: MyButton(
                    width: 110.w,
                    height: 40.h,
                    borderRadius: true,
                    color: MyColors.blueColor,
                    onPressed: () {
                      Get.toNamed(MyRoute.infoprofilecompanytow);
                    },
                    child: Text(
                      "التالي",
                      style: font15greyebold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
