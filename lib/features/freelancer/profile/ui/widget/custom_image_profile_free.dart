// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/features/company/profiles/controller/_info_comapny_profile_controller.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_profile_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomimageprofileFree extends StatelessWidget {
  FreeProfileControllerIm controllerIm;
  CustomimageprofileFree({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              controllerIm.addImageback();
            },
            child: SizedBox(
                width: double.infinity,
                height: 250.h,
                child: GetBuilder<FreeProfileControllerIm>(
                  builder: (_) {
                    return SizedBox(
                        width: double.infinity,
                        child: controllerIm.backgroundImageUrl == null
                            ? Image.asset(
                                ImagesUrl.imagetest,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                controllerIm.backgroundImageUrl!,
                                fit: BoxFit.cover,
                              ));
                  },
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 125.h, bottom: 10.h),
              child: GestureDetector(onTap: () {
                controllerIm.addImagefront();
              }, child: GetBuilder<FreeProfileControllerIm>(builder: (_) {
                return CircleAvatar(
                  backgroundColor: MyColors.blueColor,
                  radius: 90,
                 backgroundImage: controllerIm.profileImageUrl == null
                ? const AssetImage(ImagesUrl.imagetest) as ImageProvider
                : NetworkImage(controllerIm.profileImageUrl!) as ImageProvider,
                );
              })),
            ),
          ),
        ],
      ),
    );  }
}
