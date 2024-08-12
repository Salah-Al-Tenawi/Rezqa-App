// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:freelanc/core/widgets/custom_listtile.dart';
import 'package:freelanc/features/profiles/controller/any_profile_controlelr.dart';

// ignore: must_be_immutable
class DetailsAnyprofileClient extends StatelessWidget {
  AnyProfileControllerIm controllerIm;
  DetailsAnyprofileClient({
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
              title: "العنوان",
              subtitle: Text(controllerIm.clientModel!.city!),
              iconleading: const Icon(Icons.location_city)),
          CustomListTile(
              paddingsub: true,
              title: " الميلاد",
              subtitle: Text(controllerIm.clientModel!.dateOfbirht!),
              iconleading: const Icon(Icons.cake)),
          CustomListTile(
              paddingsub: true,
              title: "الجنس",
              subtitle: Text(controllerIm.clientModel!.gender=="male"?"ذكر":"أنثى"),
              iconleading: const Icon(Icons.person_pin_sharp)),
        ],
      ),
    );
  }
}
