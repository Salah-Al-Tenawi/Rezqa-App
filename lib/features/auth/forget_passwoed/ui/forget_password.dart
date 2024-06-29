import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/functions/input_valid.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/auth/forget_passwoed/controller/forgetpassword_controller.dart';
import 'package:freelanc/core/widgets/custom_text_form.dart';
import 'package:get/get.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetpasswordControllerIm controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 60.h, left: 14.w, right: 14.w, bottom: 10.h),
              child: SvgPicture.asset(
                ImagesUrl.forgetpasswordSvg,
                height: 230.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 50.h, left: 10.w, right: 10.w, bottom: 50.h),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Text(
                      "نشعر بالأسف لأنك فقدت كلمة المرور الخاصة بك لكن لا تقلق نحن هنا لمساعدتك في استرجاع حسابك ادخل بريدك الخاص ",
                      style: font16blacknormal,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Form(
                    key: controller.formkey,
                    child: CustomTextformfild(
                      validator: (val) => inputvaild(val!, "email", 20, 10),
                      title: "البريد الإلكتروني",
                      controller: controller.email,
                      icon: const Icon(Icons.email_outlined),
                    ),
                  )
                ],
              ),
            ),
            MyButton(
              width: 150.w,
              height: 50.h,
              borderRadius: true,
              onPressed: () {
                controller.gotoverfiyemil();
              },
              color: MyColors.blueColor,
              child: Text(
                "إرسال",
                style: font15greyebold,
              ),
            ),
            SizedBox(
              height: 80.h,
            )
          ],
        ),
      ),
    );
  }
}
