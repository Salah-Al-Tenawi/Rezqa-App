// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/client/profile/controller/info_client_profile_controller.dart';

// ignore: must_be_immutable
class CustomAppBarMyprofileClient extends StatelessWidget {
  ClientProfileControllerIm controllerIm;
  CustomAppBarMyprofileClient({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: Text("بروفايلي ", style: font22grayw500),
      centerTitle: false,
      backgroundColor: MyColors.blueColor,
      actions: [
        MyButton(
          onPressed: () {},
          borderRadius: true,
          color: MyColors.greyColor,
          child: Text(
            "حفظ",
            style: font14bluenormal,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        MyButton(
          onPressed: () {
            controllerIm.goToeditprofile();
          },
          splashcolor: MyColors.blueColor,
          borderRadius: true,
          color: MyColors.greyColor,
          child: Text(
            "تعديل",
            style: font14bluenormal,
          ),
        ),
        SizedBox(
          width: 10.w,
        )
      ],
    );
    
  }
}
