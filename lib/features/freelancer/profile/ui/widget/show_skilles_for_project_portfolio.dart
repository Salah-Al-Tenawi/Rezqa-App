// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/themes/color_app.dart';

// ignore: must_be_immutable
class ShowSkillesProjectPortfolio extends StatelessWidget {
  int lenghtList;
  List data;
   ShowSkillesProjectPortfolio({
    super.key,
    required this.lenghtList,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      margin: EdgeInsets.only(top: 10.h, bottom: 200.h),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: MyColors.blueColor,
            blurRadius: 5,
            offset: const Offset(0, 0))
      ], color: MyColors.greyColor, borderRadius: BorderRadius.circular(25)),
      child: Wrap(
        spacing: 10.sp,
        runSpacing: 20,
        children: List.generate(lenghtList, (index) {
          return IntrinsicWidth(
            child: IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.blueColor,
                    boxShadow: [
                      BoxShadow(
                          color: MyColors.blackColor,
                          blurRadius: 6,
                          offset: const Offset(1, 1))
                    ]),
                child: Center(
                  child: Text(
                    data[index],
                    
                    style: TextStyle(color: MyColors.greyTextfildColor),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
