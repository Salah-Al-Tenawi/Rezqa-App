import 'package:flutter/material.dart';
import 'package:freelanc/features/company/addoffercompany/controller/CombanyAddofferController.dart';
import 'package:get/get.dart';

Widget buildEssentialSkillsSection() {
  final CompanyOfferController companyOfferController = Get.put(CompanyOfferController());

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ElevatedButton(
        onPressed: () async {
          var context;
          final selectedSkills = await showDialog<List<String>>(
            context: context,
            builder: (BuildContext context) {
              final selected = List<String>.from(companyOfferController.selectedSkills.map((skill) => skill.id));
              return AlertDialog(
                title: Text('اختر المهارات الضرورية'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: companyOfferController.skills.map((skill) {
                      return CheckboxListTile(
                        value: selected.contains(skill),
                        title: Text(skill),
                        onChanged: (bool? checked) {
                          if (checked == true) {
                            selected.add(skill);
                          } else {
                            selected.remove(skill);
                          }
                          Get.back(result: selected);
                        },
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          );

          if (selectedSkills != null) {
            companyOfferController.onEssentialSkillsSelected(selectedSkills);
          }
        },
        child: Text("اختر المهارات الضرورية"),
      ),
      Wrap(
        children: companyOfferController.essentialSkills.map((skill) {
          return Chip(
            label: Text(skill.name),
            onDeleted: () {
              companyOfferController.essentialSkills.remove(skill);
              companyOfferController.update();
            },
          );
        }).toList(),
      ),
    ],
  );
}
