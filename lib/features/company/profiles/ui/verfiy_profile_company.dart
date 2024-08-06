import 'package:flutter/material.dart';
import 'package:freelanc/features/company/profiles/controller/_info_comapny_profile_controller.dart';
import 'package:freelanc/features/company/profiles/ui/widget/custom_appbar_myprofile.dart';
import 'package:freelanc/features/company/profiles/ui/widget/custom_details_profile.dart';
import 'package:freelanc/features/company/profiles/ui/widget/custom_gallary_myprofile.dart';
import 'package:freelanc/features/company/profiles/ui/widget/custom_name_myprofile.dart';
import 'package:freelanc/features/company/profiles/ui/widget/custom_stack_image_myprofile.dart';
import 'package:get/get.dart';

class VerfiyMyPfofileCompany extends StatelessWidget {
  const VerfiyMyPfofileCompany({super.key});

  @override
  Widget build(BuildContext context) {
    CompanyProfileControllerIm controllerIm = Get.find();
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () async {
        await controllerIm.getCompanyfromCashAndShowIT();
      },
      child: CustomScrollView(
        slivers: [
          CustomAppBarMyprofile(
            controllerIm: controllerIm,
          ),
          Customimageprofile(
            controllerIm: controllerIm,
          ),
          CustomNameprofile(
            controllerIm: controllerIm,
          ),
          Customdetailsprofile(
            controllerIm: controllerIm,
          ),
          CustomGallaryprofile(
            controllerIm: controllerIm,
          ),
        ],
      ),
    ));
  }
}
