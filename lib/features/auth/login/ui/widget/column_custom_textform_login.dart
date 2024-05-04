// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/functions/input_valid.dart';

import 'package:freelanc/features/auth/login/controller/login_controller.dart';
import 'package:freelanc/core/widgets/custom_text_form.dart';

// ignore: must_be_immutable
class ColumnCustomTextformlogin extends StatelessWidget {
  LoginController controller;
  ColumnCustomTextformlogin({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formkey,
      child: Column(
        children: [
          CustomTextformfild(
              validator: (val) => inputvaild(val!, "email", 20, 10),
              keyboardType: TextInputType.emailAddress,
              icon: const Icon(
                Icons.email_outlined,
              ),
              title: "البريد الإلكتروني",
              controller: controller.email),
          SizedBox(
            height: 20.h,
          ),
          CustomTextformfild(
              validator: (val) => inputvaild(val!, "password", 25, 7),
              keyboardType: TextInputType.visiblePassword,
              scureText: true,
              icon: const Icon(
                Icons.lock_clock_outlined,
              ),
              title: "كلمة المرور",
              controller: controller.password),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
