import 'package:flutter/widgets.dart';

import 'package:freelanc/features/company/addoffercompany/controller/CombanyAddofferController.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/customwidget.dart';

// ignore: must_be_immutable
class buildlocationtypeSection extends StatelessWidget {
  CompanyOfferController companyOfferController ;
   buildlocationtypeSection({
    super.key,
    required this.companyOfferController,
  });
  @override
  Widget build(BuildContext context) {
     return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomRadio(
          value: 'remotely',
          groupValue: companyOfferController.locationtype,
          onChanged: (value) =>
              companyOfferController.onlocationtypeSelected(value!),
          text: '  عن بعد  ',
        ),
        CustomRadio(
          value: 'on-site',
          groupValue: companyOfferController.locationtype,
          onChanged: (value) =>
              companyOfferController.onlocationtypeSelected(value!),
          text: 'ضمن الشركة',
        ),
        const SizedBox(width: 75),
        const Text(": مكان العمل ", style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
