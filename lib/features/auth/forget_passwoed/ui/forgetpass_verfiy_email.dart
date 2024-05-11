import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/auth/forget_passwoed/controller/forgetpassword_controller.dart';
import 'package:freelanc/features/auth/forget_passwoed/ui/widget/otp_forget_password.dart';
import 'package:get/get.dart';

class ForgetVerfiyEmail extends StatelessWidget {
  const ForgetVerfiyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetpasswordControllerIm controller = Get.find();

    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "لقد قمنا بإرسال رمز تحقق على البريد \n ${controller.email.text}",
                textAlign: TextAlign.center,
                style: font16blacknormal,
              ),
              OtptextformForgetpassword(
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
                      controller.restcode();
                    },
                    color: MyColors.blueColor,
                    child: Icon(
                      Icons.restart_alt_rounded,
                      color: MyColors.greyColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80.h,
              ),
              MyButton(
                onPressed: () {
                  if (controller.otp != null ) {
                    controller.verfiyemail();
                  } else {
                    Get.snackbar("خطأ", "لا بمكن ترك الحقل فارغ");
                  }
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
