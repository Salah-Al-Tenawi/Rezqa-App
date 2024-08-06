// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/custom_badge.dart';
import 'package:freelanc/core/widgets/custom_listtile.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_profile_controller.dart';
import 'package:get/get.dart';

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
            iconleading: const Icon(Icons.select_all),
            isThreeLine: true,
            subtitle: GetBuilder<FreeProfileControllerIm>(builder: (_) {
              return controllerIm.skilles.isEmpty
                  ? Container(
                      margin: EdgeInsets.all(20.sp),
                      width: double.infinity,
                      height: 150.h,
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Center(
                            child: Text(
                          "قم بإضافة بعض المهارات",
                          style: font22gbluew600,
                        )),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
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
                      child: Wrap(
                        spacing: 10.sp,
                        runSpacing: 20,
                        children:
                            List.generate(controllerIm.skilles.length, (index) {
                          return CustomBadge(
                            onTap: () {
                              controllerIm.removeItemForList(
                                  index, controllerIm.skilles);
                            },
                            icon: Icon(
                              Icons.cancel,
                              size: 10.sp,
                              color: Colors.red,
                            ),
                            child: IntrinsicWidth(
                              child: IntrinsicHeight(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: MyColors.blueColor,
                                      boxShadow: [
                                        BoxShadow(
                                            color: MyColors.blackColor,
                                            blurRadius: 6,
                                            offset: const Offset(1, 1))
                                      ]),
                                  child: Center(
                                    child: Text(
                                      controllerIm.skilles[index].name!,
                                      style: TextStyle(
                                          color: MyColors.greyTextfildColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    );
            })));
  }
}
