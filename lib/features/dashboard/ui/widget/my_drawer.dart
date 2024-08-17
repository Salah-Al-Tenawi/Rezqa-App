import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/custom_listtile.dart';
import 'package:freelanc/features/dashboard/controller/drawer_and_appbar_board_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  MyDrawerAndAppbarControllerIm controller;
  MyDrawer({super.key, required this.controller});

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
                  title: "المتقدمين لعروضي",
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  titleTextStyle: font15ggreyw600,
                  onTap: () => {Get.toNamed(MyRoute.JobOfferProposalCompanyPage)},
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
          controller.roleUser == "company"
              ? CustomListTile(
                  title: "حذف حسابي",
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  titleTextStyle: font15ggreyw600,
                  onTap: () => {controller.showDialogToDeletMyCompany()},
                  trailing: Icon(
                    Icons.delete_outline,
                    color: MyColors.blueColor,
                    size: 30,
                  ),
                )
              : const SizedBox(),
              controller.roleUser == "freelancer"
              ? CustomListTile(
                  title: "عروض الشركات المقدم عليها",
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  titleTextStyle: font15ggreyw600,
                  onTap: () => {Get.toNamed(MyRoute.JobOfferProposalFrelancerPage)},
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
          Divider(
            color: MyColors.greyTextfildColor,
            endIndent: 70,
            indent: 70,
          ),
          CustomListTile(
            title: "تسجيل الخروج",
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            titleTextStyle: font15ggreyw600,
            onTap: () => {controller.verFiyLogout()},
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
