// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/widgets/custom_listtile.dart';
import 'package:freelanc/features/company/profiles/controller/_info_comapny_profile_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Customdetailsprofile extends StatelessWidget {
  CompanyProfileControllerIm controllerIm;
  Customdetailsprofile({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: GetBuilder<CompanyProfileControllerIm>(builder: (_) {
      return Column(
        children: [
          CustomListTile(
            paddingsub: true,
            iconleading: const Icon(Icons.location_on_rounded),
            title: "المحافظة",
            subtitle: Text(controllerIm.city.text),
          ),
          CustomListTile(
              paddingsub: true,
              title: "المنطقة",
              subtitle: Text(controllerIm.region.text),
              iconleading: const Icon(Icons.location_city)),
          CustomListTile(
            paddingsub: true,
            iconleading: const Icon(Icons.location_on_rounded),
            title: "العنوان",
            subtitle: Text(controllerIm.streetaddress.text),
          ),
          CustomListTile(
              paddingsub: true,
              title: "نوع الشركة",
              subtitle: Text(controllerIm.selectindustry!),
              iconleading: const Icon(Icons.type_specimen)),
          CustomListTile(
              paddingsub: true,
              title: "حجم الشركة",
              subtitle: Text(controllerIm.selectsize!),
              iconleading: const Icon(Icons.label_important)),
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
