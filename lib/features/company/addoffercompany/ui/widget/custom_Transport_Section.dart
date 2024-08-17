import 'package:flutter/widgets.dart';

import 'package:freelanc/features/company/addoffercompany/controller/CombanyAddofferController.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/customwidget.dart';

// ignore: must_be_immutable
class buildTransportSection extends StatelessWidget {
  CompanyOfferController companyOfferController ;
   buildTransportSection({
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
          groupValue: companyOfferController.transport,
          onChanged: companyOfferController.onTransportSelected,
          text: 'يوجد',
        ),
        CustomRadio(
          value: false,
          groupValue: companyOfferController.transport,
          onChanged: companyOfferController.onTransportSelected,
          text: 'لا يوجد',
        ),
        const SizedBox(width: 100),
        const Text(" : المواصلات ", style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
