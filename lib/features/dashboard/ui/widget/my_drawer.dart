import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/custom_listtile.dart';
import 'package:freelanc/features/dashboard/controller/drawer_and_appbar_board_controller.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  MyDrawerAndAppbarControllerIm controller;
  MyDrawer({super.key , required this.controller});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          CustomListTile(
            title: "بروفايلي",
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            titleTextStyle: font15ggreyw600,
            onTap: () {
              controller.myprofile();
            },
            trailing: Icon(
              Icons.person_pin_sharp,
              color: MyColors.blueColor,
              size: 30,
            ),
          ),
          Divider(
            color: MyColors.greyTextfildColor,
            endIndent: 70,
            indent: 70,
          ),
          CustomListTile(
            title: "عروضي  ",
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            titleTextStyle: font15ggreyw600,
            onTap: () {
              controller.myOffers();
            },
            trailing: Icon(
              Icons.wechat_rounded,
              color: MyColors.blueColor,
              size: 30,
            ),
          ),
          Divider(
            color: MyColors.greyTextfildColor,
            endIndent: 70,
            indent: 70,
          ),
          controller.roleUser == "company"
              ? CustomListTile(
                  title: "حذف حسابي",
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  titleTextStyle: font15ggreyw600,
                  // onTap: () => {controller.showDialogToDeletMyCompany()},
                  trailing: Icon(
                    Icons.delete_outline,
                    color: MyColors.blueColor,
                    size: 30,
                  ),
                )
              : const SizedBox(),
          Divider(
            color: MyColors.greyTextfildColor,
            endIndent: 70,
            indent: 70,
          ),
          CustomListTile(
            title: "تسجيل الخروج",
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            titleTextStyle: font15ggreyw600,
            onTap: () => {controller.logOut()},
            trailing: Icon(
              Icons.login_outlined,
              color: MyColors.blueColor,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
