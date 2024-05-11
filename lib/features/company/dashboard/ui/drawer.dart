import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/custom_listtile.dart';

class DrawerCompany extends StatelessWidget {
  const DrawerCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          CircleAvatar(
            child: Image(image: AssetImage(ImagesUrl.imageOnboardingOne)),
            radius: 80,
          ),
          Text(
            "google",
            textAlign: TextAlign.center,
          ),
          CustomListTile(
            title: "معلومات الحساب",
            padding: EdgeInsets.only(top: 20.h),
            titleTextStyle: font18gbluew600,
            onTap: () => {},
            trailing: Icon(
              Icons.person_pin_sharp,
              color: MyColors.blueColor,
              size: 33,
            ),
          ),
          Divider(
            color: MyColors.greyTextfildColor,
            endIndent: 50,
            indent: 50,
          ),
          CustomListTile(
            title: "عروض التوظيف ",
            titleTextStyle: font18gbluew600,
            onTap: () => {},
            trailing: Icon(
              Icons.wechat_rounded,
              color: MyColors.blueColor,
              size: 33,
            ),
          ),
          Divider(
            color: MyColors.greyTextfildColor,
            endIndent: 50,
            indent: 50,
          ),
        ],
      ),
    );
  }
}
