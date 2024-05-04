import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/functions/input_valid.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/widgets/custom_text_form.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/profiles/controller/_info_comapny_profile_controller.dart';

import '../../../../core/themes/text_styles_app.dart';

// ignore: must_be_immutable
class CustomFormInfoPrpfileCompanyTow extends StatelessWidget {
  CompanyProfileControllerIm controller;
  CustomFormInfoPrpfileCompanyTow({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.keyfortow,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Text(
                    "معلومات التواصل ",
                    style: fontBlacksize22bold,
                  ),
                ),
              ),
              CustomTextformfild(
                validator: (val) => inputvaild(val!, "emil", 30, 5),
                title: "البريد الألكتروني  ",
                controller: controller.emailcompany,
                icon: const Icon(Icons.email_outlined),
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextformfild(
                validator: (val) => inputvaild(val!, "nubmerphone", 30, 5),
                title: "رقم الهاتف",
                controller: controller.addresCity,
                icon: const Icon(Icons.phone),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.w, top: 20.h),
                  child: Text(
                    "معلومات إضافية ",
                    style: fontBlacksize22bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: DropdownButtonFormField(
                    borderRadius: BorderRadius.circular(20),
                    decoration: InputDecoration(
                      fillColor: MyColors.greyColor,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    hint: const Text("نوع الشركة"),
                    items: controller.typecompany,
                    value: controller.selectTypecompany,
                    onChanged: (type) {
                      controller.onchangetypecompany(type);
                    }),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: DropdownButtonFormField(
                    borderRadius: BorderRadius.circular(20),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: MyColors.greyColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    hint: const Text("حجم الشـركة"),
                    items: controller.sizecompany,
                    value: controller.selectsizecompany,
                    onChanged: (type) {
                      controller.onchangetypecompany(type);
                    }),
              ),
              const Text(" . . ."),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 30.w, top: 10.h),
                  child: MyButton(
                    width: 110.w,
                    height: 40.h,
                    borderRadius: true,
                    color: MyColors.blueColor,
                    onPressed: () {},
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
