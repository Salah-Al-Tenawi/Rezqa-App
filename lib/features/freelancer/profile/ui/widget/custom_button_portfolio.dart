// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/constant/imageurl.dart';

import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_portfolio_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class CustomButtonPortfolio extends StatelessWidget {
  FreelancerPortfolioControllerIm controllerIm;
  CustomButtonPortfolio({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Padding(
          padding: EdgeInsets.only(top: 60.h, left: 150.w, bottom: 0.h),
          child: Obx(() {
            return controllerIm.isloading.value == false
                ? MyButton(
                    onPressed: () async {
                    
                        await controllerIm.savePortfoilo();
                      
                    },
                    width: 120.w,
                    height: 60.h,
                    color: MyColors.blueColor,
                    borderRadius: true,
                    splashcolor: MyColors.greyColor,
                    child: Text(
                      "التالي",
                      style: font15whitebold,
                    ))
                : SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: LottieBuilder.asset(ImagesUrl.loadingLottie1),
                  );
          }),
        ),
      ],
    );
  }
}
