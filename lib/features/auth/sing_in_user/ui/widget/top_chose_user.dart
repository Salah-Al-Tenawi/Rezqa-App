import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';

class TopChoseUser extends StatelessWidget {
  const TopChoseUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Container(
            color: MyColors.greyColor,
            width: 100.w,
            height: 130.h,
          ),
          Padding(
              padding: EdgeInsets.only(
                top: 60.h,
                right: 30.w,
              ),
              child: SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "أنا ...",
                      style: TextStyle(
                          fontSize: 35.sp, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.person,
                      size: 40.sp,
                    )
                  ],
                ),
              )),
        ]),
        Padding(
            padding: EdgeInsets.only(right: 70.w),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "أبحث عن  ...",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.search,
                  size: 40,
                )
              ],
            ))
      ],
    );
  }
}
