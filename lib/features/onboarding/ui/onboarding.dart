import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/features/onboarding/controller/onboarding_controller.dart';
import 'package:freelanc/features/onboarding/ui/widgets/body.dart';
import 'package:freelanc/features/onboarding/ui/widgets/button_&_controller.dart';
import 'package:freelanc/core/widgets/cricual_top.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  CriculalTop(
                    heghit: 50,
                    width: 150,
                    color: MyColors.greyColor,
                  ),
                  CriculalTop(
                    heghit: 0,
                    width: 150,
                    color: MyColors.blueColor,
                  ),
                ],
              ),
            ),
            const Expanded(flex: 4, child: BodyOnboarding()),
            const Expanded(flex: 1, child: ButtonOnboardingWithController()),
          ],
        ),
      )),
    );
  }
}
