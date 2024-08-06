// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_portfolio_controller.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/add_skilles_jop_portfolio.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'package:freelanc/core/functions/input_valid.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/custom_text_form.dart';

// ignore: must_be_immutable
class INfoJopPortfolio extends StatelessWidget {
  FreelancerPortfolioControllerIm controllerIm;
  INfoJopPortfolio({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 20.h, left: 200.w),
            child: Text(
              "معرض الأعمال",
              style: fontBlacksize22bold,
            )),
        CustomTextformfild(
            title: " تصنيف المشروع",
            hint: "web app , mobile app , ui/ux .......",
            controller: controllerIm.section,
            icon: const Icon(Icons.near_me_outlined),
            validator: (val) => inputvaild(val!, "section", 30, 10)),
        CustomTextformfild(
            title: " اسم المشروع",
            controller: controllerIm.title,
            icon: const Icon(Icons.near_me_outlined),
            validator: (val) => inputvaild(val!, "username", 100, 10)),
        CustomTextformfild(
            controller: controllerIm.url,
            icon: const Icon(Icons.link),
            title: "رابط المشروع ",
            validator: (val) => inputvaild(val!, "url", 300, 20)),
        CustomTextformfild(
            title: "وصف العمل  ",
            controller: controllerIm.description,
            validator: (val) => inputvaild(val!, "username", 200, 60)),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "تاريخ الانجاز",
              style: font16blacknormal,
            ),
            InkWell(
              onTap: () {
                controllerIm.selectDate(context);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    color: MyColors.blackColor,
                    size: 27.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  GetBuilder<FreelancerPortfolioControllerIm>(builder: (_) {
                    return Text(controllerIm.date);
                  })
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
