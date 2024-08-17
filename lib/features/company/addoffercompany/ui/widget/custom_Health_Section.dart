import 'package:flutter/widgets.dart';

import 'package:freelanc/features/company/addoffercompany/controller/CombanyAddofferController.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/customwidget.dart';

// ignore: must_be_immutable
class buildHealthInsuranceSection extends StatelessWidget {
  CompanyOfferController companyOfferController ;
   buildHealthInsuranceSection({
    super.key,
    required this.companyOfferController,
  });
  @override
  Widget build(BuildContext context) {
     return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomRadio(
          value: true,
          groupValue: companyOfferController.health,
          onChanged: companyOfferController.onHealthSelected,
          text: 'يوجد',
        ),
        CustomRadio(
          value: false,
          groupValue: companyOfferController.health,
          onChanged: companyOfferController.onHealthSelected,
          text: 'لا يوجد',
        ),
        const SizedBox(width: 60),
        const Text(" :التأمينات الصحية ", style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
