import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/widgets/cricual_top.dart';

// ignore: must_be_immutable
class TopsinginTextCriuc extends StatelessWidget {
  TopsinginTextCriuc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CriculalTop(
        color: MyColors.greyColor,
        heghit: 150,
        width: 150,
      ),
      CriculalTop(
        heghit: 100,
        width: 150,
        color: MyColors.blueColor,
      ),
      Container(
        padding: EdgeInsets.only(left: 80.w),
        alignment: Alignment.center,
        width: double.infinity,
        height: 120,
        child: Text(
          "إنشاء حساب",
          style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          textAlign: TextAlign.center,
        ),
      )
    ]);
  }
}
