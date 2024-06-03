import 'package:flutter/material.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/features/client/profile/controller/info_client_profile_controller.dart';
import 'package:freelanc/features/client/profile/ui/widget/custom_appbar_myprofile.dart';
import 'package:freelanc/features/client/profile/ui/widget/custom_details_profile.dart';
import 'package:freelanc/features/client/profile/ui/widget/custom_image_profile.dart';
import 'package:get/get.dart';

class VerfiyMyPfofileClient extends StatelessWidget {
  const VerfiyMyPfofileClient({super.key});

  @override
  Widget build(BuildContext context) {
    ClientProfileControllerIm controllerIm = Get.find();
    return Scaffold(
        body: CustomScrollView(slivers: [
      CustomAppBarMyprofileClient(
        controllerIm: controllerIm,
      ),
      CustomimageprofileClient(
        controllerIm: controllerIm,
      ),
      SliverToBoxAdapter(
        child: Column(
          children: [
            Text(
              controllerIm.name.text,
              style: font25boldblack,
            ),
            Divider(
              color: MyColors.greyColor,
              indent: 60,
              endIndent: 60,
            ),
          ],
        ),
      ),
      CustomdetailsprofileClient(
        controllerIm: controllerIm,
      )
    ]));
  }
}
