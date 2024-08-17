import 'package:flutter/material.dart';
import 'package:freelanc/features/company/addoffercompany/controller/CombanyAddofferController.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// ignore: must_be_immutable
class buildCategorySection extends StatelessWidget {
  CompanyOfferController companyOfferController ;
   buildCategorySection({
    super.key,
    required this.companyOfferController,
  });
  @override
  Widget build(BuildContext context) {
   return Obx(() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DropdownButton<String>(
          value: companyOfferController.selectedCategory.isEmpty
              ? null
              : companyOfferController.selectedCategory.value,
          hint: const Text('اختر تصنيف العرض'),
          onChanged: (String? newValue) {
            if (newValue != null) {
              companyOfferController.onCategorySelected(newValue);
            }
          },
          items: companyOfferController.categories
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        const SizedBox(width: 70),
        const Text(': تصنيف العرض ', style: TextStyle(fontSize: 18)),
      ],
    );
  });
  }

}