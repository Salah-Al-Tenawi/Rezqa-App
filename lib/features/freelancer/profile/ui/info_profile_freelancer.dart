import 'package:flutter/material.dart';
import 'package:freelanc/features/company/profiles/ui/widget/style_profile.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_profile_controller.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/custom_form_profile_info_freelancer.dart';
import 'package:get/get.dart';


class InfoPfofileFreelancer extends StatelessWidget {
  const InfoPfofileFreelancer({super.key});

  @override
  Widget build(BuildContext context) {
      FreeProfileControllerIm controller= Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            StyleInfoProfile(
              alignment: Alignment.topRight,
              cricularbottmleft: true,
            ),
            CustomFormInfoProfileFree(controller: controller),
           
            
              
            StyleInfoProfile(
              alignment: Alignment.bottomLeft,
              criculartopright: true,
            ),
          ],
        ),
      ),
    );
  }
}