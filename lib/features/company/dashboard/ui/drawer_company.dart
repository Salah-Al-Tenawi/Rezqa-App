import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/custom_listtile.dart';
import 'package:freelanc/features/company/dashboard/controller/drawr_company_controller.dart';
import 'package:get/get.dart';

class DrawerCompany extends StatelessWidget {
  const DrawerCompany({super.key});

  @override
  Widget build(BuildContext context) {
    DrawerCompanyControllerIm controller = Get.put(DrawerCompanyControllerIm());

    return Drawer(
      child: ListView(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(ImagesUrl.imagetest) as ImageProvider,
            // Image.network(myServices.sharedpref.getString(KeyShardpref.onboardingisShowtrue) ==null ?)

            radius: 70,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Text(
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              "google", 
              textAlign: TextAlign.center,
            ),
          ),
          CustomListTile(
            title: "بروفايلي",
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            titleTextStyle: font15ggreyw600,
            onTap: () => {controller.shwoCompany()},
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
            onTap: () => {},
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
          CustomListTile(
            title: "حذف حسابي",
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            titleTextStyle: font15ggreyw600,
            onTap: () => {controller.showDialogToDeletMyCompany()},
            trailing: Icon(
              Icons.delete_outline,
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
            title: "تسجيل الخروج",
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            titleTextStyle: font15ggreyw600,
            onTap: () => { 
              controller.logout()
            },
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
