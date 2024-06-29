// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:freelanc/core/widgets/custom_listtile.dart';
import 'package:freelanc/features/client/profile/controller/info_client_profile_controller.dart';

// ignore: must_be_immutable
class CustomdetailsprofileClient extends StatelessWidget {
  ClientProfileControllerIm controllerIm;
  CustomdetailsprofileClient({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          // CustomListTile(
          //   paddingsub: true,
          //   iconleading: const Icon(Icons.work),
          //   title: "المهنة ",
          //   subtitle: Text(controllerIm.joptitle.text),
          // ),
          CustomListTile(
              paddingsub: true,
              title: "العنوان",
              subtitle: Text(controllerIm.city.text),
              iconleading: const Icon(Icons.location_city)),
          CustomListTile(
              paddingsub: true,
              title: " الميلاد",
              subtitle: Text(controllerIm.birthday),
              iconleading: const Icon(Icons.cake)),
          CustomListTile(
              paddingsub: true,
              title: "الجنس",
              subtitle: Text(controllerIm.gender=="male"?"ذكر":"أنثى"),
              iconleading: const Icon(Icons.person_pin_sharp)),
        ],
      ),
    );
  }
}
