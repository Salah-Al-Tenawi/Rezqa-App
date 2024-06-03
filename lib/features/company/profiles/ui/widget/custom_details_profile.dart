// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/widgets/custom_listtile.dart';
import 'package:freelanc/features/company/profiles/controller/_info_comapny_profile_controller.dart';

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
            paddingsub: true,
            iconleading: const Icon(Icons.location_on_rounded),
            title: "الموقع",
            subtitle: Text(controllerIm.state.text),
          ),
          CustomListTile(
              paddingsub: true,
              title: "العنوان",
              subtitle: Text(controllerIm.location.text),
              iconleading: const Icon(Icons.location_city)),
          CustomListTile(
              paddingsub: true,
              title: "نوع الشركة",
              subtitle: Text(controllerIm.selectType!),
              iconleading: const Icon(Icons.type_specimen)),
          CustomListTile(
              paddingsub: true,
              title: "حجم الشركة",
              subtitle: Text(controllerIm.selectsize!),
              iconleading: const Icon(Icons.label_important)),
          CustomListTile(
            paddingsub: true,
            title: "ايميل التواصل",
            subtitle: Text(controllerIm.email.text),
            iconleading: const Icon(Icons.email),
          ),
          CustomListTile(
            paddingsub: true,
            title: "أرقام التواصل",
            subtitle: Container(
                height: 100.h,
                child: ListView.builder(
                    // physics: ScrollPhysics(),
                    itemCount: controllerIm.numbersphone.length,
                    itemBuilder: (context, index) {
                      return Text(controllerIm.numbersphone[index]);
                    })),
            iconleading: const Icon(Icons.phone),
          ),
          CustomListTile(
            paddingsub: false,
            title: "حسابات التواصل الإجتماعي",
            subtitle: SizedBox(
                height: 220.h,
                child: ListView.builder(
                    // physics: ScrollPhysics(),
                    itemCount: controllerIm.linkescontact.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Divider(
                            color: MyColors.greyColor,
                            indent: 60,
                            endIndent: 60,
                          ),
                          TextButton(
                            onPressed: () {
                              
                            },
                            child: Text(controllerIm.linkescontact[index]),
                          )
                        ],
                      );
                    })),
            iconleading: const Icon(Icons.link),
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
