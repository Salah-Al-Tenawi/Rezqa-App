// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/company/profiles/controller/_info_comapny_profile_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomGallaryprofile extends StatelessWidget {
  CompanyProfileControllerIm controllerIm;
  CustomGallaryprofile({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(children: [
        Text(
          "   معرض الشـركة :                         ",
          style: font23boldblack,
          textAlign: TextAlign.start,
        ),
        Text(
          " يمكنك إضافة صور لشركتـك لجذب انتباه الآخرين",
          style: TextStyle(fontSize: 15, color: MyColors.blackColor),
          textAlign: TextAlign.start,
        ),

// GallaryCompany()
        GetBuilder<CompanyProfileControllerIm>(builder: (_) {
          return Wrap(
            children: List.generate(controllerIm.gallaryUrl.length, (index) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(width: 0.5)),
                    margin:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                    width: double.infinity,
                    child: Image.network(
                      controllerIm.gallaryUrl[index] ,
                      fit: BoxFit.cover,
                    ),
                  ),
                  MyButton(
                      onPressed: () {
                        controllerIm.removeImageFromGallary(index);
                      },
                      // color: MyColors.greyColor,
                      child: Icon(
                        Icons.cancel_sharp,
                        color: MyColors.blueColor,
                        size: 40.sp,
                      ))
                ],
              );
            }),
          );
        }),
        InkWell(
            onTap: () {
              controllerIm.addgallary();
             
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
            )
            //  Container(
            //     height: 200.h,
            //     width: double.infinity,
            //     margin:
            //         EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            //     decoration: BoxDecoration(
            //         color: MyColors.greyColor,
            //         border: Border.all(color: MyColors.blueColor)),
            //     child: Icon(
            //       Icons.add_a_photo,
            //       size: 40.sp,
            //     ),
            //   )
            )
      ]),
    );
  }
}
