// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      child: Column(
        children: [
          CustomListTile(
            iconleading: const Icon(Icons.location_on_rounded),
            title: "الموقع",
            subtitle: Text(controllerIm.addresCity.text),
          ),
          CustomListTile(
              title: "العنوان",
              subtitle: Text(controllerIm.addresCountry.text),
              iconleading: const Icon(Icons.location_city)),
          CustomListTile(
              title: "نوع الشركة",
              subtitle: Text(controllerIm.selectTypecompany!),
              iconleading: const Icon(Icons.type_specimen)),
          CustomListTile(
              title: "حجم الشركة",
              subtitle: Text(controllerIm.selectsizecompany!),
              iconleading: const Icon(Icons.label_important)),
          CustomListTile(
            title: "ايميل التواصل",
            subtitle: Text(controllerIm.emailcompany.text),
            iconleading: const Icon(Icons.email),
          ),
          CustomListTile(
            title: "أرقام التواصل",
            subtitle: Container(
                height: 100.h,
                child: ListView.builder(
                    // physics: ScrollPhysics(),
                    itemCount: controllerIm.numerphoecompany.length,
                    itemBuilder: (context, index) {
                      return Text(controllerIm.numerphoecompany[index]);
                    })),
            iconleading: const Icon(Icons.phone),
          ),
          Divider(
            color: MyColors.greyColor,
            indent: 60,
            endIndent: 60,
          ),
        ],
      ),
    );
  }
}
