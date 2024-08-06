// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/functions/input_valid.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/custom_text_form.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_profile_controller.dart';

// ignore: must_be_immutable
class CustomFormInfoProfileFree extends StatelessWidget {
  FreeProfileControllerIm controller;
  CustomFormInfoProfileFree({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            height: 100.h,
            validator: (val) => inputvaild(val!, "username", 200, 10),
            title: "نبذة عني ",
            controller: controller.description,
            icon: const Icon(Icons.add_reaction),
          ),
          Text(
            "المهارات و الخبرات",
            style: font22gbluew600,
          ),
          
        ],
      ),
    );
  }
} 


// to show skiles in size box
