import 'package:flutter/material.dart';

import 'package:freelanc/features/company/addoffercompany/controller/CombanyAddofferController.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/customwidget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// ignore: must_be_immutable
class buildMilitaryServiceSection extends StatelessWidget {
  CompanyOfferController companyOfferController ;
   buildMilitaryServiceSection({
    super.key,
    required this.companyOfferController,
  });
  @override
  Widget build(BuildContext context) {
   return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomRadio(
              value: true,
              groupValue: companyOfferController.militaryserver,
              onChanged: companyOfferController.onMilitarySelected,
              text: 'يوجد ',
            ),
            CustomRadio(
              value: false,
              groupValue: companyOfferController.militaryserver,
              onChanged: companyOfferController.onMilitarySelected,
              text: 'لا يوجد ',
            ),
            const Text(': حالة الخدمة العسكرية ',
                style: TextStyle(fontSize: 18)),
          ],
        ),
        Obx(() {
          if (companyOfferController.militaryserver == false) {
            return buildMilitaryRequirementSection();
          } else {
            return SizedBox.shrink();
          }
        }),
      ],
    );
  }
  Widget buildMilitaryRequirementSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("ليس إلزامي"),
        const SizedBox(width: 10),
        Obx(() {
          return Switch(
            value: companyOfferController.MilitaryserverRequired,
            onChanged: (value) {
              companyOfferController.onMilitaryRequiredChanged(value);
            },
          );
        }),
        const SizedBox(width: 10),
        const Text("إلزامي"),
        const SizedBox(width: 10),
      ],
    );
  }
}