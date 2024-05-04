import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/auth/sing_in_user/controller/verfiyemal_controller.dart';
import 'package:freelanc/features/auth/sing_in_user/ui/widget/otp_textform.dart';
import 'package:get/get.dart';

class VerfiyEmailSingin extends StatelessWidget {
  const VerfiyEmailSingin({super.key});

  @override
  Widget build(BuildContext context) {
    VerfiyEmailControllerIm controller = Get.put(VerfiyEmailControllerIm());
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "  لقد قمنا بإرسال رمز التحقق على البريد \n ${controller.email}",
                textAlign: TextAlign.center,
                style: font16blacknormal,
              ),
              OtpTextform(
                controllerIm: controller,
              ),
              const Text(". . ."),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "قم بإعادة الإرسال",
                    style: TextStyle(color: MyColors.greyTextColor),
                  ),
                  SizedBox(
                    width: 50.h,
                  ),
                  MyButton(
                    onPressed: () {
                      controller.resendcode();
                    },
                    color: MyColors.blueColor,
                    child: Icon(
                      Icons.restart_alt_rounded,
                      color: MyColors.greyColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 80.h,
              ),
              MyButton(
                onPressed: () {
                  controller.otp == null
                      ? Get.snackbar("خطأ", "يجب عليك إدخال الرمز")
                      : controller.verfiyemailandlogin(
                          controller.email, controller.otp!);
                },
                width: 150.w,
                height: 50.h,
                color: MyColors.blueColor,
                borderRadius: true,
                child: Icon(
                  Icons.verified_outlined,
                  color: MyColors.greyColor,
                  size: 35,
                ),
              ),
              SizedBox(
                height: 100.h,
              )
            ],
          )),
    ));
  }
}
