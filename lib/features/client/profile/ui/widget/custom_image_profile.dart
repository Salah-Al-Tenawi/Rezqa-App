// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/features/client/profile/controller/info_client_profile_controller.dart';
import 'package:freelanc/features/company/profiles/controller/_info_comapny_profile_controller.dart';
import 'package:freelanc/features/company/profiles/ui/widget/imageback_front_profile.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomimageprofileClient extends StatelessWidget {
  ClientProfileControllerIm controllerIm;
  CustomimageprofileClient({
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
              controllerIm.picedImage("back");
              print(controllerIm.imageback.toString());
            },
            child: SizedBox(
              width: double.infinity,
              height: 250.h,
              child: Hero(
                  tag: 'profileImage',
                  child: GetBuilder<ClientProfileControllerIm>(builder: (_) {
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
                  controllerIm.picedImage("front");
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
