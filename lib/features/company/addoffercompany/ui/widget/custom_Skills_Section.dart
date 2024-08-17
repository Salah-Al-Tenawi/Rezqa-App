import 'package:flutter/material.dart';
import 'package:freelanc/features/company/addoffercompany/controller/CombanyAddofferController.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class buildSkillsSection extends StatelessWidget {
  final CompanyOfferController companyOfferController;

  buildSkillsSection({
    super.key,
    required this.companyOfferController,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(': المهارات ', style: TextStyle(fontSize: 18)),
          ],
        ),
        TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'ابحث عن المهارات',
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                await companyOfferController.fetchSkills(searchController.text);
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        Obx(() {
          if (companyOfferController.skills.isEmpty) {
            return Container(); // إخفاء قائمة الاختيار إذا لم تكن هناك مهارات
          }
          return ElevatedButton(
            onPressed: () async {
              final selectedSkills = await showDialog<List<String>>(
                context: context,
                builder: (BuildContext context) {
                  final selected = List<String>.from(companyOfferController.selectedSkills.map((skill) => skill.id));
                  return AlertDialog(
                    title: Text('اختر المهارات'),
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
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, selected),
                        child: Text('اختيار'),
                      ),
                    ],
                  );
                },
              );

              if (selectedSkills != null) {
                companyOfferController.onSkillsSelected(selectedSkills);
              }
            },
            child: Text("اختر المهارات"),
          );
        }),
        Wrap(
          children: companyOfferController.selectedSkills
              .map((skill) => Chip(
                    label: Text(skill.id),
                    onDeleted: () {
                      companyOfferController.selectedSkills.remove(skill);
                      companyOfferController.update();
                    },
                  ))
              .toList(),
        ),
      ],
    );
  }
}
