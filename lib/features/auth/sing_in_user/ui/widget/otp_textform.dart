import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/features/auth/sing_in_user/controller/verfiyemal_controller.dart';

// ignore: must_be_immutable
class OtpTextform extends StatelessWidget {
  VerfiyEmailControllerIm controllerIm;
  
  OtpTextform({super.key, required this.controllerIm});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 4,
      borderColor: MyColors.blueColor,

      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      filled: true,

      borderRadius: BorderRadius.circular(20),
      margin: EdgeInsets.symmetric(vertical: 30.h),
      fieldWidth: 50.w,
      fieldHeight: 80.h,

      //runs when every textfield is filled
      onSubmit: (String verificationCode) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(" تـأكـيد"),
                content: Text('رمز التحقق الذي أدخلته $verificationCode'),
              );
            });
        controllerIm.otp = verificationCode;
      },
    );
  }
}
