// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/features/company/profiles/ui/widget/style_profile.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_portfolio_controller.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/add_files_portfolio.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/add_images_portfolio.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/add_skilles_jop_portfolio.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/custom_button_portfolio.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/info_jop_portfolio.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AddPortfolio extends StatelessWidget {
  FreelancerPortfolioControllerIm controllerIm = Get.put(FreelancerPortfolioControllerIm());

  AddPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            StyleInfoProfile(
              alignment: Alignment.topRight,
              cricularbottmleft: true,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                child: Text(
                  " قم بإضافة عدة أعمال قمت بها لتثبت جدارتك !",
                  textAlign: TextAlign.center,
                  style: font16blacknormal,
                )),
           Form( 
            key: controllerIm.keyForm,
            child: Column(children: [ 
             INfoJopPortfolio(
              controllerIm: controllerIm,
            ),
            AddSkillesJopPortfolio(controllerIm: controllerIm),
           ],)),
           
            AddFilesPortfolio(
              controllerIm: controllerIm,
            ),
            AddImagesPortfolio(
              controllerIm: controllerIm,
            ),
            CustomButtonPortfolio(
              controllerIm: controllerIm,
            ),
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
