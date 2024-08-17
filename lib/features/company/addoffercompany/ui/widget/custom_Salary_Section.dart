import 'package:flutter/material.dart';
import 'package:freelanc/features/company/addoffercompany/controller/CombanyAddofferController.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:numberpicker/numberpicker.dart';

// ignore: must_be_immutable
class buildSalarySection extends StatelessWidget {
  CompanyOfferController companyOfferController ;
   buildSalarySection({
    super.key,
    required this.companyOfferController,
  });
  @override
  Widget build(BuildContext context) {
     return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(": الراتب ", style: TextStyle(fontSize: 18)),
          ],
        ),
        buildSalaryPicker(
          label: "الحد الأدنى",
          value: companyOfferController.minsalary,
          onChanged: (value) => companyOfferController.minsalary.value = value,
        ),
        buildSalaryPicker(
          label: "الحد الأعلى",
          value: companyOfferController.maxsalary,
          onChanged: (value) => companyOfferController.maxsalary.value = value,
        ),
      ],
    );
  }

Widget buildSalaryPicker({
    required String label,
    required RxInt value,
    required ValueChanged<int> onChanged,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberPicker(
              value: value.value,
              minValue: 100000,
              maxValue: 2000000,
              step: 100000,
              onChanged: onChanged,
              selectedTextStyle: const TextStyle(
                fontSize: 20,
                color: Colors.deepPurpleAccent,
              ),
              axis: Axis.horizontal,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$label : ${value.value}"),
          ],
        ),
      ],
    );
  }
}