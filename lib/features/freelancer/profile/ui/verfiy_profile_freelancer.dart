import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_profile_controller.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/custom_appbar_profile_freelancer.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/custom_details_profile_free.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/custom_image_profile_free.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/custom_name_profile_free.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/custom_skilles_free.dart';
import 'package:get/get.dart';

class VerfiyprofileFreelancer extends StatelessWidget {
  const VerfiyprofileFreelancer({super.key});

  @override
  Widget build(BuildContext context) {
    FreeProfileControllerIm controllerIm = Get.find();
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        CustomAppBarProfileFree(
          controllerIm: controllerIm,
        ),
        CustomimageprofileFree(
          controllerIm: controllerIm,
        ),
        CustomNameprofileFree(
          controllerIm: controllerIm,
        ),
        CustomdetailsprofileFree(
          controllerIm: controllerIm,
        ),
        CustomSkillesFree(controllerIm: controllerIm,),

        // CustomGallaryprofile(
        //   controllerIm: controllerIm,
        // ),
      ],
    ));
  }
}
