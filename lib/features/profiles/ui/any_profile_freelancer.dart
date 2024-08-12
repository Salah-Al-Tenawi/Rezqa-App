import 'package:flutter/material.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/go_show_my_portfolio_freelancer.dart';

import 'package:freelanc/features/profiles/controller/any_profile_controlelr.dart';
import 'package:freelanc/features/profiles/ui/widget/details_any_profile_freelancer.dart';
import 'package:freelanc/features/profiles/ui/widget/image_any_profile_freelancer.dart';
import 'package:freelanc/features/profiles/ui/widget/name_any_profile_freelancer.dart';
import 'package:freelanc/features/profiles/ui/widget/go_show_any_portfolio.dart';
import 'package:freelanc/features/profiles/ui/widget/skilles_any_profile_freelancer.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AnyProfileFreelnacer extends StatelessWidget {
  AnyProfileControllerIm controllerIm = Get.put(AnyProfileControllerIm());
  AnyProfileFreelnacer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () async {},
      child: CustomScrollView(
        slivers: [
          ImagesAnyProfileFreelancer(
            controllerIm: controllerIm,
          ),
          NameAnyprofileFree(
            controllerIm: controllerIm,
          ),
          DetailsAnyProfileFree(
            controllerIm: controllerIm,
          ),
          SkillesAnyFree(
            controllerIm: controllerIm,
          ),
          // GoShowAnyProtfolio(
          //   controllerIm: controllerIm,
          // ),
        ],
      ),
    ));
  }
}
