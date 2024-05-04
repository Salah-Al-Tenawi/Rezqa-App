import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/auth/forget_passwoed/controller/re_password_controller.dart';
import 'package:freelanc/features/auth/forget_passwoed/ui/widget/custom_form_repassword.dart';
import 'package:get/get.dart';

class RePassword extends StatelessWidget {
  const RePassword({super.key});

  @override
  Widget build(BuildContext context) {
    RePasswordController controllerIm = Get.put(RePasswordControllerIm());
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
              child: Image(image: AssetImage(ImagesUrl.imageRepassowrd))),
          CustomFromRepassword(
            controller: controllerIm,
          ),
          SizedBox(
            height: 30.h,
          ),
          MyButton(
            onPressed: () {
              controllerIm.changepassowrd();
            },
            width: 150.w,
            height: 50.h,
            borderRadius: true,
            color: MyColors.blueColor,
            child: Text(
              "إرسال",
              style: font15greyebold,
            ),
          ),
          SizedBox(
            height: 60.h,
          )
        ],
      ),
    );
  }
}
