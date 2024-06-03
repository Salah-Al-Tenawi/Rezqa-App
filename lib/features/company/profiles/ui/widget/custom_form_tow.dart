import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/functions/input_valid.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/widgets/custom_dropdown.dart';
import 'package:freelanc/core/widgets/custom_text_form.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/company/profiles/controller/_info_comapny_profile_controller.dart';
import 'package:freelanc/features/company/profiles/ui/widget/custom_column_info_contact.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import '../../../../../core/themes/text_styles_app.dart';
import 'package:dropdown_search/dropdown_search.dart';

// ignore: must_be_immutable
class CustomFormInfoPrpfileCompanyTow extends StatelessWidget {
  CompanyProfileControllerIm controller;
  CustomFormInfoPrpfileCompanyTow({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.keyformtow,
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
                controller: controller.email,
                icon: const Icon(Icons.email_outlined),
                keyboardType: TextInputType.emailAddress,
              ),
              ColumnInfoContactCompany(
                controller: controller,
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
              CustomDropdown(
                left: 20.w,
                right: 20.w,
                bottom: 20.h,
                items: controller.type,
                labelText: "نوع الشركة",
                selectedItem: controller.selectType,
                onChanged: (type) {
                  controller.changType(type);
                },
              ),
              CustomDropdown(
                left: 20.w,
                right: 20.w,
                bottom: 20.h,
                items: controller.type,
                labelText: "حجم الشركة",
                selectedItem: controller.selectType,
                onChanged: (size) {
                  controller.changSize(size);
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 30.w, top: 10.h),
                  child: MyButton(
                    width: 110.w,
                    height: 40.h,
                    borderRadius: true,
                    color: MyColors.blueColor,
                    onPressed: () {
                      controller.goprofile();
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
