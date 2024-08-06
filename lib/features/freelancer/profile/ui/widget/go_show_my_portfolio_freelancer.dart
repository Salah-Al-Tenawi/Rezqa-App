// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_profile_controller.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/name_with_icon_portfolio.dart';

// ignore: must_be_immutable
class GoShowMyProtfolio extends StatelessWidget {
  FreeProfileControllerIm controllerIm;
  GoShowMyProtfolio({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: controllerIm.myServices.sharedpref
                    .getString(KeyShardpref.roleuser) ==
                "freelancer"
            ? Column(
                children: [
                  NameWithIconPortfolio(
                      name: "معرض الأعمال", icon: Icons.browse_gallery_sharp),
                  MyButton(
                    onPressed: () {
                      controllerIm.gotoShowMyPortfolio();
                    },
                    child: Container(
                      height: 300.h,
                      width: 300.w,
                      margin: EdgeInsets.symmetric(vertical: 40.h),
                      decoration: BoxDecoration(
                        color: MyColors.greyColor,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              color: MyColors.blueColor,
                              offset: const Offset(-10, 10)),
                          BoxShadow(
                              blurRadius: 3,
                              color: MyColors.blueColor,
                              offset: const Offset(10, -10))
                        ],
                      ),
                      child: SvgPicture.asset(
                        ImagesUrl.portfolio,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Image.asset(ImagesUrl.imageSucssesVerfiy)
                  ),
                ],
              )
            : const SizedBox());
  }
}
