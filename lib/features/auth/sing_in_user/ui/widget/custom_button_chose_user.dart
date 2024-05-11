// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';

class CustomButtonChoseuser extends StatelessWidget {
  String title;
  String subtitle;
  Icon icon;
  void Function()? onTap;

   CustomButtonChoseuser({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
     this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: MyColors.blueColor, width: 2),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: MyColors.blueColor,
                offset: const Offset(5, 5),
                blurRadius: 2)
          ]),
      margin: EdgeInsets.only(bottom: 20.h),
      width: 330.w,
      height: 130.h,
      child: ListTile(
        title: Text(
         title,
          style: font22gbluew600,
        ),
        subtitle: Text(
  subtitle,
          style: font13greybold,
        ),
        leading: icon,
        onTap: onTap,
      ),
    );
  }
}
