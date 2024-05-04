// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/functions/input_valid.dart';
import 'package:freelanc/core/widgets/custom_text_form.dart';
import 'package:freelanc/features/auth/sing_in_user/controller/singin_controller.dart';

// ignore: must_be_immutable
class ColumnCustomTextformfildSingin extends StatelessWidget {
  SinginControllerIm controller;
  ColumnCustomTextformfildSingin({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 75.h,
        child: Row(
          children: [
            Expanded(
              child: CustomTextformfild(
                validator: (val) =>
                  inputvaild(val!, "username", 10, 2),
                
                title: "الأسم الأول",
                controller: controller.fistname,
                icon: const Icon(Icons.person), 
                keyboardType: TextInputType.name,
              ),
            ),
            Expanded(
              child: CustomTextformfild(
                validator: (val) =>
                  inputvaild(val!, "username", 10, 2),
                
                title: "الأسم الأخير",
                controller: controller.lastname,
                icon: const Icon(Icons.groups_2_outlined),
                keyboardType: TextInputType.name,

              ),
            ),
          ],
        ),
      ),
      CustomTextformfild(
          validator: (val) =>
            inputvaild(val!, "email", 20, 10),
          
          icon: const Icon(Icons.email),
          title: "البريد الإلكتروني ",
          controller: controller.email,
          keyboardType: TextInputType.emailAddress,),


      CustomTextformfild( 
        validator: (val) =>
              inputvaild(val!, "password", 25, 7),
            
          icon: const Icon(Icons.lock),
          title: "كلمة المرور", 
          keyboardType: TextInputType.visiblePassword,
          scureText: true,
          controller: controller.password ),
      CustomTextformfild( 
        validator: (val) =>
              inputvaild(val!, "password", 20, 7),
            
          icon: const Icon(Icons.lock),
          title: " تأكيد كلمة المرور",
          keyboardType: TextInputType.visiblePassword,
          scureText: true,
          controller: controller.configpassword),
    ]);
  }
}
