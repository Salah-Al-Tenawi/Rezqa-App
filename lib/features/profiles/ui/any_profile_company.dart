import 'package:flutter/material.dart';
import 'package:freelanc/features/profiles/controller/any_profile_controlelr.dart';
import 'package:freelanc/features/profiles/ui/widget/details_any_profile_company.dart';
import 'package:freelanc/features/profiles/ui/widget/gallary_any_profile.dart';
import 'package:freelanc/features/profiles/ui/widget/image_any_profile_company.dart';
import 'package:freelanc/features/profiles/ui/widget/name_any_profile_company.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AnyProfileCompany extends StatelessWidget {
   AnyProfileControllerIm controllerIm = Get.put(AnyProfileControllerIm());
   AnyProfileCompany({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () async {},
      child: CustomScrollView(
        slivers: [
          ImagesAnyProfileCompany(
            controllerIm: controllerIm,
          ),
          NameAnyprofileCompany(
            controllerIm: controllerIm,
          ),
          DetailsAnyprofileCompany(controllerIm: controllerIm),
          GallaryAnyprofileCompany(
            controllerIm: controllerIm,
          ),
        ],
      ),
    ));
  }
}
