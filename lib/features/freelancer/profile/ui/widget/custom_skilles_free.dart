// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/widgets/custom_listtile.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_profile_controller.dart';

// ignore: must_be_immutable
class CustomSkillesFree extends StatelessWidget {
  FreeProfileControllerIm controllerIm;
  CustomSkillesFree({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: CustomListTile(
      title: "المهارات و الخبرات",
      iconleading:const Icon(Icons.select_all),
      isThreeLine: true,
      subtitle: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          margin: EdgeInsets.only(top: 10.h),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: MyColors.blueColor,
                    blurRadius: 5,
                    offset: const Offset(0, 0))
              ],
              color: MyColors.greyColor,
              borderRadius: BorderRadius.circular(25)),
          width: 320.w,
          height: 170.h,
          child: Wrap(
            spacing: 10.sp,
            runSpacing: 20,
            children: List.generate(controllerIm.skilles.length, (index) {
              return Stack(
                children: [
                  IntrinsicWidth(
                    child: IntrinsicHeight(
                      child: Container(
                        // width: 60.w,
                        // height: 40.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: MyColors.blueColor,
                            boxShadow: [
                              BoxShadow(
                                  color: MyColors.blackColor,
                                  blurRadius: 6,
                                  offset:const Offset(1, 1))
                            ]),
                        child: Center(
                          child: Text(
                            controllerIm.skilles[index],
                            style: TextStyle(color: MyColors.greyTextfildColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: -4, // تعديل الموضع لضبط الأيقونة بشكل صحيح
                      right: -2, // تعديل الموضع لضبط الأيقونة بشكل صحيح
                      child: GestureDetector(
                          onTap: () {
                            controllerIm.skilles.removeAt(index);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            padding:
                                const EdgeInsets.all(4), // حجم الأيقونة الصغيرة
                            child: const Icon(
                              Icons.cancel,
                              color: Colors.white,
                              size: 10, // حجم الأيقونة
                            ),
                          )))
                ],
              );
            }),
          )),
    ));
  }
}
