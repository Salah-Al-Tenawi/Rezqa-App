// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/constant/imageurl.dart';

import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/custom_listtile.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_portfolio_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class AddFilesPortfolio extends StatelessWidget {
  FreelancerPortfolioControllerIm controllerIm;
  AddFilesPortfolio({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 35.h, left: 200.w, bottom: 25.h),
            child: Text(
              "ملفات المشروع",
              style: fontBlacksize22bold,
            )),
        const Text("اضف بعض الملفات التوضيحية (اختياري)"),
        SizedBox(
          height: 10.h,
        ),
        GetBuilder<FreelancerPortfolioControllerIm>(builder: (_) {
          return controllerIm.loadingFile == false
              ? Wrap(
                  children:
                      List.generate(controllerIm.filemodel.length, (index) {
                    return CustomListTile(
                      onTap: () {},
                      title: controllerIm.filemodel[index].extention,
                      subtitle: Text(controllerIm.filemodel[index].url!),
                      color: MyColors.greyColor,
                      // padding: EdgeInsets.all(50),
                      margin: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),

                      iconleading: const Icon(Icons.file_copy),
                    );
                  }),
                )
              : SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: Lottie.asset(ImagesUrl.loadingLottie1, height: 100),
                );
        }),
        MyButton(
          onPressed: () {
            controllerIm.uploadFile();
          },
          width: 100.w,
          height: 50.h,
          color: MyColors.blueColor,
          child: Icon(
            Icons.add,
            color: MyColors.greyColor,
          ),
        ),
      ],
    );
  }
}
