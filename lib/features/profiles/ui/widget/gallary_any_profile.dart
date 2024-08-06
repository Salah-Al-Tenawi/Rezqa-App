// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/functions/show_full_image.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/features/profiles/controller/any_profile_controlelr.dart';

// ignore: must_be_immutable
class GallaryAnyprofileCompany extends StatelessWidget {
  AnyProfileControllerIm controllerIm;
  GallaryAnyprofileCompany({
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
        

// GallaryCompany()
        Wrap(
          children: List.generate(controllerIm.companyModel!.gallary?.length??0, (index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    showFullImage(controllerIm.companyModel!.gallary![index].url!);
                  },
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(width: 0.5)),
                    margin: EdgeInsets.symmetric(
                        horizontal: 30.w, vertical: 10.h),
                    width: double.infinity,
                    child: Image.network(
                     controllerIm.companyModel!.gallary![index].url!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
               
              ],
            );
          }),
        ),
             ]),
    );
  }
}
