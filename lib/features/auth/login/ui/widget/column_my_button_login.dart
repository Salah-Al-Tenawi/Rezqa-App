// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/constant/imageurl.dart';

import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/auth/login/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class ColumnMyButtonlogin extends StatelessWidget {
  LoginController controller;
  ColumnMyButtonlogin({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => controller.isloading.value == false
                ? MyButton(
                    onPressed: () {
                      controller.login();
                    },
                    borderRadius: true,
                    color: MyColors.blueColor,
                    width: 140.w,
                    child: Text(
                      "تسجيل",
                      style: font15greyebold,
                    ),
                  )
                : Lottie.asset(ImagesUrl.loadingLottie1, height: 100)

            
            ),
        MyButton(
            onPressed: () {
              controller.gotoforgetpassord();
            },
            child: Text(
              "هل نسيت كلمة المرور؟",
              style: font16blacknormal,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("ليس لديك حساب بالفعل ؟"),
            MyButton(
                onPressed: () {
                  controller.gotosingup();
                },
                child: Text(
                  "إنشاء حساب",
                  style: font17normalblue,
                ))
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ".  .  .  .  .  .        ",
              style: TextStyle(color: MyColors.blueColor),
            ),
            InkWell(
              onTap: () {
                controller.loginwithgoogle();
              },
              child: const CircleAvatar(
                child: Image(image: AssetImage(ImagesUrl.imagegoogle)),
              ),
            ),
            Text(
              "       .  .  .  .  .  .  .",
              style: TextStyle(color: MyColors.blueColor),
            ),
          ],
        )
      ],
    );
  }
}
