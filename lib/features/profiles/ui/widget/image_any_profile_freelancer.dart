// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/functions/show_full_image.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/features/profiles/controller/any_profile_controlelr.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ImagesAnyProfileFreelancer extends StatelessWidget {
  AnyProfileControllerIm controllerIm;
  ImagesAnyProfileFreelancer({
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
              if (controllerIm.freelancerModel?.backgroundImageUrl != null &&
                  controllerIm.freelancerModel?.backgroundImageUrl != "") {
                showFullImage(
                    controllerIm.freelancerModel!.backgroundImageUrl!);
              }
            },
            child: SizedBox(
                width: double.infinity,
                height: 250.h,
                child: GetBuilder<AnyProfileControllerIm>(
                  builder: (_) {
                    return SizedBox(
                        width: double.infinity,
                        child:
                            controllerIm.freelancerModel?.backgroundImageUrl ==
                                        null ||
                                    controllerIm.freelancerModel
                                            ?.backgroundImageUrl ==
                                        ""
                                ? Image.asset(
                                    ImagesUrl.imagetest,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    controllerIm
                                        .freelancerModel!.backgroundImageUrl!,
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
                if (controllerIm.freelancerModel?.profileImageUrl != null &&
                    controllerIm.freelancerModel?.profileImageUrl != "") {
                  showFullImage(controllerIm.freelancerModel!.profileImageUrl!);
                }
              }, child: GetBuilder<AnyProfileControllerIm>(builder: (_) {
                return CircleAvatar(
                  backgroundColor: MyColors.blueColor,
                  radius: 90,
                  backgroundImage: controllerIm
                                  .freelancerModel?.profileImageUrl ==
                              null ||
                          controllerIm.freelancerModel?.profileImageUrl == ""
                      ? const AssetImage(ImagesUrl.imagetest) as ImageProvider
                      : NetworkImage(
                              controllerIm.freelancerModel!.profileImageUrl!)
                          as ImageProvider,
                );
              })),
            ),
          ),
        ],
      ),
    );
  }
}
