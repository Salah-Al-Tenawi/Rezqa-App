import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/onboarding/controller/onboarding_controller.dart';
import 'package:freelanc/features/onboarding/data/static.dart';
import 'package:get/get.dart';

class ButtonOnboardingWithController extends GetView<OnboardingControllerImp> {
  const ButtonOnboardingWithController({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<OnboardingControllerImp>(builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  onboardingList.length,
                  (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 900),
                        width: controller.cruntpage == index ? 20.w : 6.w,
                        height: 6.h,
                        margin: EdgeInsets.only(right: 5.w),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.1, color: MyColors.greyColor),
                            color: MyColors.blueColor,
                            borderRadius: BorderRadius.circular(10)),
                      )),
            ],
          );
        }),
        SizedBox(
          height: 30.h,
        ),
        GetBuilder<OnboardingControllerImp>(builder: (_) {
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: controller.cruntpage < onboardingList.length - 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyButton(
                          onPressed: () {
                            controller.skip();
                          },
                          splashcolor: MyColors.blueColor,
                          color: MyColors.greyColor,
                          child: Text(
                            "تخطي",
                            style: TextStyle(color: MyColors.blackColor),
                          ),
                        ),
                        MyButton(
                          onPressed: () {
                            controller.next();
                          },
                          color: MyColors.blueColor,
                          child: const Text(
                            "التالي",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  : MyButton(
                      height: 45.h,
                      width: 200.w,
                      color: MyColors.blueColor,
                      onPressed: () {
                        controller.go();
                      },
                      child: Text(
                        "انطلق",
                        style: font15greyebold,
                      ),
                    ));
        })
      ],
    );
  }
}
