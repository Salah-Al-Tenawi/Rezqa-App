import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/features/auth/login/controller/login_controller.dart';
import 'package:freelanc/features/auth/login/ui/widget/column_custom_textform_login.dart';
import 'package:freelanc/features/auth/login/ui/widget/column_my_button_login.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginControllerIm());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 20.h)),
            Padding(
              padding: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 10.h),
              child: SvgPicture.asset(
                ImagesUrl.loginSvg,
                height: 220.sp,
              ),
            ),
            ColumnCustomTextformlogin(
              controller: controller,
            ),
            ColumnMyButtonlogin(controller: controller),
          ],
        ),
      )),
    );
  }
}
