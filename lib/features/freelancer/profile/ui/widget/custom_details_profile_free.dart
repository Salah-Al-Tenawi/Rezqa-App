// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/widgets/custom_listtile.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_profile_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomdetailsprofileFree extends StatelessWidget {
  FreeProfileControllerIm controllerIm;
  CustomdetailsprofileFree({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: GetBuilder<FreeProfileControllerIm>(builder: (_) {
      return Column(
        children: [
          CustomListTile(
              paddingsub: true,
              title: "المسمى الوظيفي",
              subtitle: Text(controllerIm.joproleModel != null
                  ? controllerIm.joproleModel!.name!
                  : ""),
              iconleading: const Icon(Icons.work)),
          CustomListTile(
            paddingsub: true,
            iconleading: const Icon(Icons.location_on_rounded),
            title: "المدينة",
            subtitle: Text(controllerIm.city.text),
          ),
          CustomListTile(
              paddingsub: true,
              title: "الميلاد",
              subtitle: Text(controllerIm.birthday),
              iconleading: const Icon(Icons.type_specimen)),
          CustomListTile(
              paddingsub: true,
              title: "الجنس",
              subtitle: Text(controllerIm.gender == "female" ? "أنثى" : "ذكر"),
              iconleading: const Icon(Icons.label_important)),
          CustomListTile(
            title: "نبذة عني",
            subtitle: Container(
              margin: EdgeInsets.symmetric(vertical: 10.sp),
              padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 10.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: MyColors.greyColor,
                  )),
              child: Text(controllerIm.description.text),
              // height: 450.h,
            ),
            iconleading: const Icon(Icons.edit_document),
            isThreeLine: true,
          ),
          Divider(
            color: MyColors.greyColor,
            indent: 60,
            endIndent: 60,
          ),
        ],
      );
    }));
  }
}
