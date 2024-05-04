// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/auth/sing_in_user/controller/singin_controller.dart';

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
        GetBuilder<SinginControllerIm>(
          builder: (_) {
            return Container(
              child: controller.circle == true
                  ?  CircularProgressIndicator( 
                    backgroundColor: MyColors.blueColor,
                    
                  )
                  : MyButton(
                      onPressed: () {
                        controller.sigin();
                      },
                      color: MyColors.blueColor,
                      width: 120.w,
                      borderRadius: true,
                      child: Text("التالي", style: font15greyebold),
                    ),
            );
          },
        ),
        Divider(
          color: MyColors.blueColor,
          indent: 100,
          endIndent: 100,
          height: 10.h,
        ),
        MyButton(
          onPressed: () {},
          color: MyColors.blueColor,
          width: 100.w,
          child: Text(
            "تسجيل الدخول بحساب غوغل",
            style: font15greyebold.copyWith(fontWeight: FontWeight.normal),
          ),
        ),
        MyButton(
          onPressed: () {
            Get.back();
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
