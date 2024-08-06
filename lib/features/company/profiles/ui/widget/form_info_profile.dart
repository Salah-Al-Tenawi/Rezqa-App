// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/functions/input_valid.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/custom_dropdown.dart';
import 'package:freelanc/core/widgets/custom_text_form.dart';
import 'package:freelanc/features/company/profiles/controller/_info_comapny_profile_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomFormInfoProfile extends StatelessWidget {
  CompanyProfileControllerIm controller;
  CustomFormInfoProfile({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.keyform,
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
                controller: controller.city,
                icon: const Icon(Icons.location_city_outlined),
              ),
              CustomTextformfild(
                validator: (val) => inputvaild(val!, "username", 30, 2),
                title: "المنطقة",
                controller: controller.region,
                icon: const Icon(Icons.location_searching),
              ),
              CustomTextformfild(
                validator: (val) => inputvaild(val!, "username", 30, 2),
                title: "العنوان",
                controller: controller.streetaddress,
                icon: const Icon(Icons.location_on_rounded),
              ),
              CustomTextformfild(
                validator: (val) => inputvaild(val!, "username", 200, 10),
                title: "وصف الشركة",
                controller: controller.descrption,
                icon: const Icon(Icons.add_reaction),
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
              Obx(() {
                return controller.allindustry.toList().isNotEmpty
                    ? CustomDropdown(
                        left: 20.w,
                        right: 20.w,
                        bottom: 20.h,
                        items: controller.allindustry.toList(),
                        labelText: "نوع الشركة",
                        selectedItem: controller.selectindustry,
                        onChanged: (type) {
                          controller.changType(type);
                        },
                      )
                    : const CircularProgressIndicator();
                
              }),
              CustomDropdown(
                left: 20.w,
                right: 20.w,
                bottom: 20.h,
                items: controller.size,
                labelText: "حجم الشركة",
                selectedItem: controller.selectsize,
                onChanged: (size) {
                  controller.changSize(size);
                },
              ),
            ],
          ),
        ));
  }
}
