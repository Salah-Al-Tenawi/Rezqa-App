import 'package:flutter/material.dart';
import 'package:freelanc/features/company/addoffercompany/controller/CombanyAddofferController.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:numberpicker/numberpicker.dart';

// ignore: must_be_immutable
class buildAgeRangeSection extends StatelessWidget {
  CompanyOfferController companyOfferController;
  buildAgeRangeSection({
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
            Text(": المدى العمري ", style: TextStyle(fontSize: 18)),
          ],
        ),
        buildAgePicker(
          label: "الحد الأدنى",
          value: companyOfferController.minage,
          onChanged: (value) => companyOfferController.minage.value = value,
        ),
        buildAgePicker(
          label: "الحد الأعلى",
          value: companyOfferController.maxage,
          onChanged: (value) => companyOfferController.maxage.value = value,
        ),
        Obx(() {
          if (companyOfferController.minage.value !=
                  companyOfferController.maxage.value &&
              companyOfferController.minage.value <
                  companyOfferController.maxage.value) {
            return buildAgeRequirementSection();
          } else {
            return SizedBox.shrink();
          }
        }),
      ],
    );
  }

  Widget buildAgePicker({
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
              minValue: 20,
              maxValue: 60,
              step: 5,
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
  
  Widget buildAgeRequirementSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("ليس إلزامي"),
        const SizedBox(width: 10),
        Obx(() {
          return Switch(
            value: companyOfferController.AgeRequired,
            onChanged: (value) {
              companyOfferController.onAgeRequiredChanged(value);
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
Widget buildAgePicker({
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
              minValue: 20,
              maxValue: 60,
              step: 5,
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
