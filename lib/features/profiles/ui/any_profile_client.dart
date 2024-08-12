import 'package:flutter/material.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';

import 'package:freelanc/features/profiles/controller/any_profile_controlelr.dart';
import 'package:freelanc/features/profiles/ui/widget/details_any_profile_client.dart';
import 'package:freelanc/features/profiles/ui/widget/images_any_profile_client.dart';
import 'package:get/get.dart';

class AnyProfileClient extends StatelessWidget {
  AnyProfileControllerIm controllerIm = Get.put(AnyProfileControllerIm());
  AnyProfileClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      ImagesAnyProfileClient(
        controllerIm: controllerIm,
      ),
      SliverToBoxAdapter(
        child: SizedBox(
          child: Column(
            children: [
              Text(
                controllerIm.clientModel!.username ?? "",
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
      ),
      DetailsAnyprofileClient(
        controllerIm: controllerIm,
      )
    ]));
  }
}
