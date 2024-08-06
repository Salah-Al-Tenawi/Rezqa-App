import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/company/profiles/ui/widget/style_profile.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_profile_controller.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/custom_form_profile_info_freelancer.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/more_info_profile_free.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/skilles_joprole_chose_free.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class InfoPfofileFreelancer extends StatelessWidget {
  const InfoPfofileFreelancer({super.key});

  @override
  Widget build(BuildContext context) {
    FreeProfileControllerIm controller = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            StyleInfoProfile(
              alignment: Alignment.topRight,
              cricularbottmleft: true,
            ),
            Form(
                key: controller.formkey,
                child: Column(
                  children: [
                    CustomFormInfoProfileFree(controller: controller),
                    SkillesAndJoprole(
                      controller: controller,
                    ),
                  ],
                )),
            MoreINfoProfileFreelancer(
              controller: controller,
            ),
            Obx(() => controller.isloading.value == false
                ? Padding(
                    padding: EdgeInsets.only(top: 70.h, left: 120.w),
                    child: MyButton(
                      width: 110.w,
                      height: 40.h,
                      borderRadius: true,
                      color: MyColors.blueColor,
                      onPressed: () async {
                        if (controller.formkey.currentState!.validate()) {
                          // await controller.savePorofile();
                          await controller.gotoMyprofileforsave();
                        }
                      },
                      child: Text(
                        "التالي",
                        style: font15greyebold,
                      ),
                    ),
                  )
                : SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: Lottie.asset(ImagesUrl.loadingLottie2),
                  )),
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
