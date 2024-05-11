// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/themes/color_app.dart';

// ignore: must_be_immutable
class StyleInfoProfile extends StatelessWidget {
  bool? cricularbottmleft;
  bool? criculartopright;
  AlignmentGeometry? alignment;

  StyleInfoProfile({
    this.cricularbottmleft,
    this.criculartopright,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment!,
      child: Container(
        width: 100.w,
        height: 130.h,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: MyColors.blueColor,
                  blurRadius: 10,
                  offset: const Offset(2, 5))
            ],
            color: MyColors.blueColor,
            borderRadius: BorderRadius.only(
                bottomLeft: cricularbottmleft == true
                    ? const Radius.circular(50)
                    : const Radius.circular(0),
                topRight: criculartopright == true
                    ? const Radius.circular(50)
                    : const Radius.circular(0))),
      ),
    );
  }
}
