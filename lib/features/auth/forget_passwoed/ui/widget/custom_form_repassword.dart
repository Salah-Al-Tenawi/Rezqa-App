// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/functions/input_valid.dart';
import 'package:freelanc/features/auth/forget_passwoed/controller/re_password_controller.dart';

import '../../../../../core/widgets/custom_text_form.dart';

// ignore: must_be_immutable
class CustomFromRepassword extends StatelessWidget {
  RePasswordController controller;
   CustomFromRepassword({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Form(
        key: controller.formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextformfild(
              validator: (val) => inputvaild(val!, "password", 25, 7),
              title: "كلمة المرور الجديدة",
              keyboardType: TextInputType.visiblePassword,
              scureText: true,
              controller: controller.newpassword,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextformfild(
                validator: (val) => inputvaild(val!, "password", 25, 7),
                title: "  تأكيد كلمة المرور الجديدة",
                keyboardType: TextInputType.visiblePassword,
                scureText: true,
                controller: controller.renewpassword),
          ],
        ));
  }
}
