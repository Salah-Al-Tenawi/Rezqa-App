// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/features/company/profiles/controller/_info_comapny_profile_controller.dart';
import 'package:freelanc/features/company/profiles/ui/widget/imageback_front_profile.dart';
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
              // controllerIm.imageback == null
              //     ? controllerIm.addImageback()
              //     : Get.to(Imagebackground,arguments: controllerIm.imageback);
            },
            child: Container(
              width: double.infinity,
              height: 250.h,
              child: Hero(
                  tag: 'profileImage',
                  child: GetBuilder<FreeProfileControllerIm>(builder: (_) {
                    return controllerIm.imageback == null
                        ? Image.asset(
                            ImagesUrl.imagetest,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            controllerIm.imageback!,
                            fit: BoxFit.cover,
                          );
                  })),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 125.h, bottom: 10.h),
              child: GestureDetector(
                onTap: () {
                  controllerIm.imagefront == null
                      ? controllerIm.addImagefront()
                      : Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ImageFront(),
                        ));
                },
                child: CircleAvatar(
                  backgroundColor: MyColors.blueColor,
                  radius: 90,
                  backgroundImage: const AssetImage(ImagesUrl.imagetest),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
