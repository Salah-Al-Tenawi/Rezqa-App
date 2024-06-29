// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/functions/input_valid.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/custom_dropdown.dart';
import 'package:freelanc/core/widgets/custom_text_form.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_profile_controller.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/more_info_profile_freelancer.dart';

// ignore: must_be_immutable
class CustomFormInfoProfileFree extends StatelessWidget {
  FreeProfileControllerIm controller;
  CustomFormInfoProfileFree({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.formkey,
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
                  "معلومات البروفايل",
                  style: font22gbluew600,
                ),
              ),
              CustomTextformfild(
                validator: (val) => inputvaild(val!, "username", 30, 2),
                title: "المسمى الوظيفي",
                controller: controller.joprole,
                icon: const Icon(Icons.location_city_outlined),
              ),
              CustomTextformfild(
                validator: (val) => inputvaild(val!, "username", 100, 2),
                title: "وصف قصير",
                controller: controller.headline,
                icon: const Icon(Icons.edit_location_outlined),
                keyboardType: TextInputType.name,
              ),
              CustomTextformfild(
                validator: (val) => inputvaild(val!, "username", 30, 2),
                title: "المدينة",
                controller: controller.city,
                icon: const Icon(Icons.location_searching),
              ),
              CustomTextformfild(
                height: 300.h,
                validator: (val) => inputvaild(val!, "username", 200, 10),
                title: "نبذة عني ",
                controller: controller.description,
                icon: const Icon(Icons.add_reaction),
              ),
            Text(
                "المهارات و الخبرات",
                style: font22gbluew600,
              ),
              CustomDropdown(
                  top: 30.h,
                  left: 20.w,
                  right: 20.w,
                  items: controller.skillesId,
                  labelText: "اختر مهاراتك"),
              MoreInfoProfileFree(
                controller: controller,
              ),
              Padding(
                padding: EdgeInsets.only(top: 70.h, left: 120.w),
                child: MyButton(
                  width: 110.w,
                  height: 40.h,
                  borderRadius: true,
                  color: MyColors.blueColor,
                  onPressed: () {
                    // controller.gotoverfiyProfile();
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


// to show skiles in size box
