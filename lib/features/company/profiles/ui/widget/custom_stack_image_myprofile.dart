// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/company/profiles/controller/_info_comapny_profile_controller.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class Customimageprofile extends StatelessWidget {
  CompanyProfileControllerIm controllerIm;
  Customimageprofile({
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
              if (controllerIm.imagebackUrl != null) {
                controllerIm.showFullImage(controllerIm.imagebackUrl!);
              }
            },
            onLongPress: () {
              Get.bottomSheet(Container(
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
                          Get.back();
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
                child: GetBuilder<CompanyProfileControllerIm>(
                  builder: (_) {
                    return SizedBox(
                        width: double.infinity,
                        child: controllerIm.imagebackUrl == null
                            ? Image.asset(
                                ImagesUrl.imagetest,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                controllerIm.imagebackUrl!,
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
                if (controllerIm.imagefrontUrl != null) {
                  controllerIm.showFullImage(controllerIm.imagefrontUrl!);
                }
              }, onLongPress: () {
                Get.bottomSheet(Container(
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
                            controllerIm.addImagefront();
                            Get.back();
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
              }, child: GetBuilder<CompanyProfileControllerIm>(builder: (_) {
                return CircleAvatar(
                  backgroundColor: MyColors.blueColor,
                  radius: 90,
                  backgroundImage: controllerIm.imagefrontUrl == null
                      ? const AssetImage(ImagesUrl.imagetest) as ImageProvider
                      : NetworkImage(controllerIm.imagefrontUrl!)
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

// Stack(
//         children: [
//           GestureDetector(
//             onTap: () {

//             },
//             child: Container(
//               width: double.infinity,
//               height: 250.h,
//               child: Hero(
//                   tag: 'profileImage',
//                   child: GetBuilder<CompanyProfileControllerIm>(builder: (_) {
//                     return controllerIm.imageback == null
//                         ? Image.asset(
//                             ImagesUrl.imagetest,
//                             fit: BoxFit.cover,
//                           )
//                         : Image.file(
//                             controllerIm.imageback!,
//                             fit: BoxFit.cover,
//                           );
//                   })),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: EdgeInsets.only(top: 125.h, bottom: 10.h),
//               child: GestureDetector(
//                 onTap: () {
//                   controllerIm.imagefront == null
//                       ? controllerIm.addImagefront()
//                       : Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => ImageFront(),
//                         ));
//                 },
//                 child: CircleAvatar(
//                   backgroundColor: MyColors.blueColor,
//                   radius: 90,
//                   backgroundImage: const AssetImage(ImagesUrl.imagetest),
//                 ),
//               ),
//             ),
//           ),
//         ],
