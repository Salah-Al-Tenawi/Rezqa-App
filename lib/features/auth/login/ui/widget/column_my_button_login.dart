// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/auth/login/controller/login_controller.dart';

// ignore: must_be_immutable
class ColumnMyButtonlogin extends StatelessWidget {
  LoginController controller;
  ColumnMyButtonlogin({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyButton(
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
                  style: fontBluesize22bold,
                ))
          ],
        ),
      ],
    );
  }
}
