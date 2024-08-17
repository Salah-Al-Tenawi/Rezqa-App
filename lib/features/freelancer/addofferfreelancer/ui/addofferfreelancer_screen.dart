import 'package:flutter/material.dart';
import 'package:freelanc/features/freelancer/addofferfreelancer/controller/FreelancerAddOfferController.dart';
import 'package:get/get.dart';
import 'package:file_selector/file_selector.dart';
import 'package:dotted_border/dotted_border.dart';

class FreelancerOfferForm extends StatelessWidget {
  final AddFreelancerOfferController controller =
      Get.put(AddFreelancerOfferController());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController daysController = TextEditingController();

  FreelancerOfferForm({super.key});

  String? validateDays(String value) {
    if (value.isEmpty || value.length > 3) {
      return 'عدد الأيام يجب أن يكون بين 1 و 3 أرقام.';
    }
    return null;
  }

  String? validateTitle(String value) {
    if (value.length < 5) {
      return 'عنوان العرض يجب أن يكون على الأقل 5 حروف.';
    }
    if (value.length > 255) {
      return 'عنوان العرض يجب أن لا يتجاوز 255 حرف.';
    }
    return null;
  }

  String? validateDescription(String value) {
    if (value.length < 100) {
      return 'وصف العرض يجب أن يكون على الأقل 100 حرف.';
    }
    if (value.length > 2000) {
      return 'وصف العرض يجب أن لا يتجاوز 2000 حرف.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                buildTextField(
                  controller: titleController,
                  label: 'عنوان العرض',
                  onChanged: (value) => controller.title.value = value,
                  validator: validateTitle,
                ),
                const SizedBox(height: 16),
                buildTextField(
                  controller: descriptionController,
                  label: 'وصف العرض',
                  onChanged: (value) => controller.description.value = value,
                  validator: validateDescription,
                  minLines: 3,
                  maxLines: 5,
                ),
                const SizedBox(height: 16),
                buildNumberField(
                  label: 'الحد الأدنى للسعر',
                  onChanged: (value) => controller.minPrice.value = value,
                ),
                const SizedBox(height: 16),
                buildNumberField(
                  label: 'الحد الأقصى للسعر',
                  onChanged: (value) => controller.maxPrice.value = value,
                ),
                const SizedBox(height: 16),
                buildTextField(
                  controller: daysController,
                  label: 'عدد الأيام لإكمال العرض',
                  onChanged: (value) => controller.days.value = value,
                  validator: validateDays,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                buildSubCategoryDropdown(),
                const SizedBox(height: 16),
                const Text(
                  'قم بأختيار المهارات',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                buildSkillSearchField(),
                const SizedBox(height: 16),
                buildSkillChips(),
                const Text(
                  'يجب اختيار على الأقل خمس مهارات.',
                  style: TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 16),
                buildSelectedSkillChips(),
                const SizedBox(height: 16),
                const Text(
                  'يرجى رفع الملفات المعبرة عن المطلوب بالعرض بصيغ PDF, zip, .',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                buildFileUploadButton(),
                const SizedBox(height: 16),
                buildSelectedFileChips(),
                const SizedBox(height: 16),
                buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required Function(String) onChanged,
    String? Function(String)? validator,
    int minLines = 1,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        errorText: validator != null ? validator(controller.text) : null,
      ),
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: keyboardType,
    );
  }

  Widget buildNumberField(
      {required String label, required Function(String) onChanged}) {
    return buildTextField(
      controller: TextEditingController(),
      label: label,
      onChanged: onChanged,
      keyboardType: TextInputType.number,
    );
  }

  Widget buildSubCategoryDropdown() {
    return Obx(() {
      if (controller.categories.isEmpty) {
        return const Text('جاري تحميل التصنيفات...');
      }
      return DropdownButton<int>(
        hint: const Text('اختر فئة فرعية'),
        value: controller.selectedSubCategoryId.value,
        onChanged: (int? newValue) {
          controller.selectedSubCategoryId.value = newValue;
          // ignore: avoid_print
          print('Selected sub-category ID: $newValue');
        },
        items: controller.categories.expand<DropdownMenuItem<int>>((category) {
          return category['sub_categories']
              .map<DropdownMenuItem<int>>((subCategory) {
            return DropdownMenuItem<int>(
              value: subCategory['id'],
              child: Text(subCategory['name']),
            );
          }).toList();
        }).toList(),
      );
    });
  }

  Widget buildSkillSearchField() {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'بحث عن المهارات',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) async {
        await controller.fetchSkills(value);
      },
    );
  }

  Widget buildSkillChips() {
    return Obx(() {
      return Wrap(
        children: controller.skills
            .where((skill) => !controller.selectedSkills.contains(skill))
            .map((skill) {
          return ChoiceChip(
            label: Text(skill['name']),
            selected: controller.selectedSkills.contains(skill),
            onSelected: (selected) {
              if (selected) {
                controller.selectedSkills.add(skill);
                // ignore: avoid_print
                print('Selected skill ID: ${skill['id']}');
              }
            },
          );
        }).toList(),
      );
    });
  }

  Widget buildSelectedSkillChips() {
    return Obx(() {
      return Wrap(
        children: controller.selectedSkills.map((skill) {
          return Chip(
            label: Text(skill['name']),
            onDeleted: () {
              controller.selectedSkills.remove(skill);
            },
          );
        }).toList(),
      );
    });
  }

  Widget buildFileUploadButton() {
    return GestureDetector(
      onTap: () async {
        const typeGroup =
            XTypeGroup(label: 'documents', extensions: ['pdf', 'doc', 'docx']);
        final files = await openFiles(acceptedTypeGroups: [typeGroup]);

        for (final file in files) {
          final filePath = file.path;
          final fileName = file.name;
          final fileId = await controller.uploadFile(filePath);
          if (fileId != null) {
            controller.selectedFiles.add({'id': fileId, 'name': fileName});
          } else {
            Get.snackbar(
              'خطأ في رفع الملفات',
              'حدث خطأ أثناء رفع الملف: $fileName',
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        }
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        dashPattern: [6, 3],
        color: Colors.blue,
        // ignore: sized_box_for_whitespace
        child: Container(
          width: double.infinity,
          height: 150,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.cloud_upload, size: 50, color: Colors.blue),
              SizedBox(height: 8),
              Text('اختر الملف', style: TextStyle(color: Colors.blue)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSelectedFileChips() {
    return Obx(() {
      return Wrap(
        children: controller.selectedFiles.map((file) {
          return Chip(
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.picture_as_pdf, color: Colors.red),
                const SizedBox(width: 8),
                Text(file['name']),
              ],
            ),
            onDeleted: () {
              controller.selectedFiles.remove(file);
            },
          );
        }).toList(),
      );
    });
  }

  Widget buildSubmitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() {
          bool hasMinSkills = controller.selectedSkills.length >= 5;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!hasMinSkills) const SizedBox(height: 8),
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 42, 84, 124),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
              onPressed: () {
                controller.submitOffer();
              },
              child: const Text(
                'إضافة العرض',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
            ],
          );
        }),
      ],
    );
  }
}
