import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:get/get.dart';

class SucssesVerfiyEmail extends StatelessWidget {
  const SucssesVerfiyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        const Image(image: AssetImage(ImagesUrl.imageSucssesVerfiy)),
          Text(
            "تم تأكيد الحساب بنجاح",
            style: fontBluesize22bold,
          ),
          const Text(". . ."),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 40.h, left: 30.w, right: 30.w),
            child: MyButton(
                onPressed: () {
                  Get.offAllNamed(MyRoute.chosetypeuser);
                },
                height: 60.h,
                width: double.infinity,
                color: MyColors.blueColor,
                borderRadius: true,
                child: Text(
                  "انطلق",
                  style: font15greyebold,
                )),
          )
        ],
      ),
    );
  }
}
