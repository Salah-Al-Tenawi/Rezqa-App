// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';

// ignore: must_be_immutable
class DescrptionsPortfolio extends StatelessWidget {
  String descrptions;
  DescrptionsPortfolio({
    super.key,
    required this.descrptions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
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
      child: Text(
        style: font15ggreyw600,
        descrptions,
        textAlign: TextAlign.center,
      ),
    );
  }
}
