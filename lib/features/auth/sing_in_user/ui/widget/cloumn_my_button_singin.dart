// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/constant/imageurl.dart';
import 'package:get/get.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/auth/sing_in_user/controller/singin_controller.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class ColumnMyButtonSingin extends StatelessWidget {
  SinginControllerIm controller;
  ColumnMyButtonSingin({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 20.h),
            child: Obx(
              () => controller.circle.value == false
                  ? MyButton(
                      onPressed: () {
                        controller.sigin();
                      },
                      color: MyColors.blueColor,
                      width: 120.w,
                      borderRadius: true,
                      child: Text("التالي", style: font15greyebold),
                    )
                  : LottieBuilder.asset(
                      ImagesUrl.loadingLottie2,
                      height: 80,
                    ),
            )),
        Divider(
          color: MyColors.blueColor,
          indent: 100,
          endIndent: 100,
          height: 40.h,
        ),
        MyButton(
          onPressed: () {
            controller.gotologin();
          },
          child: Text(
            "لدي حساب",
            style: font16blacknormal,
          ),
        ),
      ],
    );
  }
}
