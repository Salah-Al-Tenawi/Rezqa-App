// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_portfolio_controller.dart';
import 'package:get/get.dart';

import 'package:freelanc/core/functions/show_full_image.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';

// ignore: must_be_immutable
class AddImagesPortfolio extends StatelessWidget {
  FreelancerPortfolioControllerIm controllerIm;
  AddImagesPortfolio({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 30.h, left: 200.w),
            child: Text(
              " صور المشروع",
              style: fontBlacksize22bold,
            )),
        const Text("اضف بعض الصور التوضيحيحة للمشروع"),
        Column(children: [
          GetBuilder<FreelancerPortfolioControllerIm>(builder: (_) {
            return Wrap(
              children: List.generate(controllerIm.images.length, (index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        showFullImage(controllerIm.images[index].url!);
                      },
                      child: Container(
                        decoration:
                            BoxDecoration(border: Border.all(width: 0.5)),
                        margin: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 10.h),
                        width: double.infinity,
                        child: Image.network(
                          controllerIm.images[index].url!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    MyButton(
                        onPressed: () {
                          Get.defaultDialog(
                              title: "تحقق",
                              content: const Text("هل تود حذف الصورة"),
                              actions: [
                                MyButton(
                                    color: MyColors.blueColor,
                                    onPressed: () {
                                      controllerIm.removeItemForLIst(controllerIm.images,index);
                                      Get.back();
                                    },
                                    child: Text(
                                      "تأكيد",
                                      style: font13whitebold,
                                    ))
                              ]);
                        },
                        child: Icon(
                          Icons.cancel_sharp,
                          color: Colors.red,
                          size: 40.sp,
                        ))
                  ],
                );
              }),
            );
          }),
          InkWell(
              onTap: () {
                controllerIm.addImage();
              },
              child: Container(
                height: 50.h,
                width: 100.w,
                margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: MyColors.blueColor,
                          offset: const Offset(5, 5),
                          blurRadius: 5)
                    ],
                    color: MyColors.greyColor,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: MyColors.blueColor,
                    )),
                child: Column(
                  children: [
                    Text(
                      "اضافة المزيد",
                      style: font10blacknormal,
                    ),
                    Icon(
                      Icons.add_a_photo,
                      size: 20.sp,
                    ),
                  ],
                ),
              ))
        ]),
      ],
    );
  }
}
