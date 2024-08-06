// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/widgets/custom_badge.dart';
import 'package:freelanc/features/dashboard/controller/drawer_and_appbar_board_controller.dart';

// ignore: must_be_immutable
class AppBarDashboard extends StatelessWidget implements PreferredSizeWidget{
  MyDrawerAndAppbarControllerIm controller;
  AppBarDashboard({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.blueColor,
      actions: [
        controller.roleUser=="company"?const SizedBox():
        CustomBadge(
          badgeColor: Colors.red,
          icon: Container(
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Text(
              "10",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
          ),
          border: true,
          child: InkWell(
            onTap: () {
              controller.gotoMYchat();
            },
            child: Container(
              margin: EdgeInsets.only(left: 8.w, bottom: 5.h, right: 8.w),
              width: 35.w,
              height: 45.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      offset: const Offset(5, 5),
                      color: MyColors.blackColor)
                ],
                shape: BoxShape.circle,
                color: MyColors.greyColor,
              ),
              child: const Icon(Icons.chat),
            ),
          ),
        ),
        CustomBadge(
          badgeColor: Colors.red,
          icon: Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(50.sp)),
            child: Text(
              "10",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
          ),
          border: true,
          child: InkWell(
            onTap: () {
              controller.gotoMynotifications();
            },
            child: Container(
              margin: EdgeInsets.only(left: 8.w, bottom: 5.h, right: 1.w),
              width: 35.w,
              height: 45.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      offset: const Offset(5, 5),
                      color: MyColors.blackColor)
                ],
                borderRadius: BorderRadius.circular(30.sp),
                color: MyColors.greyColor,
              ),
              child: const Icon(Icons.notifications),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        )
      ],
    );
  }
  
 @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
