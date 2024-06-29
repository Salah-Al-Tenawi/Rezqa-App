// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/client/profile/controller/info_client_profile_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomImageprofileClient extends StatelessWidget {
  ClientProfileControllerIm controllerIm;
  CustomImageprofileClient({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {},
            onLongPress: () {
              Get.bottomSheet(
                Container(
                width: double.infinity,
                height: 200.h,
                color: MyColors.greyColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "المعرض",
                      style: font23boldblack,
                    ),
                    MyButton(
                        onPressed: () {
                          controllerIm.addImageback();
                        },
                        width: 100,
                        height: 100,
                        borderRadius: true,
                        color: MyColors.blueColor,
                        child: Icon(
                          Icons.image,
                          color: MyColors.greyColor,
                          size: 50.sp,
                        )),
                  ],
                ),
              ));

            
            },
            child: SizedBox(
                width: double.infinity,
                height: 250.h,
                child: GetBuilder<ClientProfileControllerIm>(
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
              }, child: GetBuilder<ClientProfileControllerIm>(builder: (_) {
                return CircleAvatar(
                  backgroundColor: MyColors.blueColor,
                  radius: 90,
                  backgroundImage: controllerIm.profileImgeUrl == null
                      ? const AssetImage(ImagesUrl.imagetest) as ImageProvider
                      : NetworkImage(controllerIm.profileImgeUrl!)
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