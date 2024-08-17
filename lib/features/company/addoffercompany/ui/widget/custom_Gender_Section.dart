import 'package:flutter/material.dart';

import 'package:freelanc/features/company/addoffercompany/controller/CombanyAddofferController.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/customwidget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// ignore: must_be_immutable
class buildGenderSection extends StatelessWidget {
  CompanyOfferController companyOfferController ;
   buildGenderSection({
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
              value: 'null',
              groupValue: companyOfferController.gender,
              onChanged: companyOfferController.onGenderSelected,
              text: 'لا يهم',
            ),
            CustomRadio(
              value: 'female',
              groupValue: companyOfferController.gender,
              onChanged: companyOfferController.onGenderSelected,
              text: 'أنثى',
            ),
            CustomRadio(
              value: 'male',
              groupValue: companyOfferController.gender,
              onChanged: companyOfferController.onGenderSelected,
              text: 'ذكر',
            ),
            const SizedBox(width: 70),
            const Text(': النوع ', style: TextStyle(fontSize: 18)),
          ],
        ),
        Obx(() {
          if (companyOfferController.gender == 'male' ||
              companyOfferController.gender == 'female') {
            return buildGenderRequirementSection();
          } else {
            return SizedBox.shrink();
          }
        }),
      ],
    );
  }
Widget buildGenderRequirementSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("ليس إلزامي"),
        const SizedBox(width: 10),
        Obx(() {
          return Switch(
            value: companyOfferController.GenderRequired,
            onChanged: (value) {
              companyOfferController.onGenderRequiredChanged(value);
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
 