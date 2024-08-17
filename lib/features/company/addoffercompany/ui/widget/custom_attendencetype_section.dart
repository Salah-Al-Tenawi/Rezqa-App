import 'package:flutter/widgets.dart';

import 'package:freelanc/features/company/addoffercompany/controller/CombanyAddofferController.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/customwidget.dart';

// ignore: must_be_immutable
class buildattendencetypeSection extends StatelessWidget {
  CompanyOfferController companyOfferController ;
   buildattendencetypeSection({
    super.key,
    required this.companyOfferController,
  });
  @override
  Widget build(BuildContext context) {
     return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomRadio(
          value: 'full-time',
          groupValue: companyOfferController.attendencetype,
          onChanged: (value) =>
              companyOfferController.onattendencetypeSelected(value!),
          text: 'دوام كامل',
        ),
        CustomRadio(
          value: 'part-time',
          groupValue: companyOfferController.attendencetype,
          onChanged: (value) =>
              companyOfferController.onattendencetypeSelected(value!),
          text: ' دوام جزئي',
        ),
        const SizedBox(width: 80),
        const Text(": نوع الدوام ", style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
