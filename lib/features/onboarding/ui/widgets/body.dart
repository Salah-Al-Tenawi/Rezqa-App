import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/features/onboarding/controller/onboarding_controller.dart';
import 'package:freelanc/features/onboarding/data/static.dart';
import 'package:get/get.dart';

class BodyOnboarding extends StatelessWidget {
  const BodyOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingControllerImp controller = Get.put(OnboardingControllerImp());
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onchanged(value);
      },
      itemCount: onboardingList.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(onboardingList[index].image!),
              height: 400.h,
            ),
            Text(
              onboardingList[index].title!,
              style: fontBlacksize22bold,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                onboardingList[index].subtitle!,
                textAlign: TextAlign.center,
                style: TextStyle(height: 1.5.h, color: MyColors.greyTextColor),
              ),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        );
      },
    );
  }
}
