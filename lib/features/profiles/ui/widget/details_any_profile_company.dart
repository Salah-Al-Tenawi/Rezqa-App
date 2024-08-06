// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/widgets/custom_listtile.dart';
import 'package:freelanc/features/profiles/controller/any_profile_controlelr.dart';

// ignore: must_be_immutable
class DetailsAnyprofileCompany extends StatelessWidget {
  AnyProfileControllerIm controllerIm;
  DetailsAnyprofileCompany({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
          children: [
            CustomListTile(
              paddingsub: true,
              iconleading: const Icon(Icons.location_on_rounded),
              title: "المحافظة",
              subtitle: Text(controllerIm.companyModel!.city??""),
            ),
            CustomListTile(
                paddingsub: true,
                title: "المنطقة",
                subtitle: Text(controllerIm.companyModel!.region??""),
                iconleading: const Icon(Icons.location_city)),
            CustomListTile(
              paddingsub: true,
              iconleading: const Icon(Icons.location_on_rounded),
              title: "العنوان",
              subtitle: Text(controllerIm.companyModel!.streetaddress??""),
            ),
            CustomListTile(
                paddingsub: true,
                title: "نوع الشركة",
                subtitle: Text(controllerIm.companyModel!.industryname??""),
                iconleading: const Icon(Icons.type_specimen)),
            CustomListTile(
                paddingsub: true,
                title: "حجم الشركة",
                subtitle: Text(controllerIm.companyModel!.size??""),
                iconleading: const Icon(Icons.label_important)),
            Divider(
              color: MyColors.greyColor,
              indent: 60,
              endIndent: 60,
            ),
          ],
        ));
  }
}
