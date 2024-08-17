import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:freelanc/features/company/addoffercompany/controller/CombanyAddofferController.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// ignore: must_be_immutable
class buildJobRoleSection extends StatelessWidget {
  CompanyOfferController companyOfferController ;
   buildJobRoleSection({
    super.key,
    required this.companyOfferController,
  });
    final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 90, left: 90),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'ابحث عن الدور الوظيفي',
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  await companyOfferController
                      .fetchJobRoles(searchController.text);
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Obx(() {
          if (companyOfferController.jobRoles.isEmpty) {
            return Text('لا يوجد أدوار وظيفية متاحة.');
          }
          return Center(
            child: DropdownButton<JobRole>(
              hint: Text('اختر الدور الوظيفي'),
              value: companyOfferController.selectedJobRole.value,
              items: companyOfferController.jobRoles.map((JobRole role) {
                return DropdownMenuItem<JobRole>(
                  value: role,
                  child: Text(role.name),
                );
              }).toList(),
              onChanged: (JobRole? newValue) {
                companyOfferController.selectJobRole(newValue);
              },
            ),
          );
        }),
      ],
    );
  }
}
