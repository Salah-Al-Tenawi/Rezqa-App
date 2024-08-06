// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';

// ignore: must_be_immutable
class NameWithIconPortfolio extends StatelessWidget {
  String name;
  IconData icon;
   NameWithIconPortfolio({
    super.key,
    required this.name,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 30.h, left: 100.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: MyColors.blueColor,
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
             name,
              style: font25boldblack,
            ),
          ],
        ));
  }
}
