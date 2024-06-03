// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

import 'package:freelanc/core/widgets/custom_text_form.dart';
import 'package:freelanc/features/company/profiles/controller/_info_comapny_profile_controller.dart';

// ignore: must_be_immutable
class ColumnInfoContactCompany extends StatelessWidget {
  late CompanyProfileControllerIm controller;
  ColumnInfoContactCompany({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomTextformfild(
                width: 235.w,
                controller: controller.cruntephone,
                title: "أرقام التواصل",
                icon: const Icon(Icons.phone),
                onFieldSubmitted: (value) {
                  if (value.isNotEmpty && value.length == 10) {
                    controller.numbersphone.add(value);
                  }
                },
                validator: (val) {
                  if (controller.numbersphone.isEmpty) {
                    return " يجب ادخال رقم هاتف على الأقل";
                  }

                  return null;
                }),
            IconButton(
              onPressed: () {
                controller.addnumberphone(controller.cruntephone.text);
                controller.cruntephone.clear();
              },
              icon: const Icon(Icons.add),
            ),
            IconButton(
                onPressed: () {
                  if (controller.numbersphone.isNotEmpty) {
                    controller.showlistdialog(controller.numbersphone);
                  }
                },
                icon: const Icon(Icons.list))
          ],
        ),
        // to do
        Row(
          children: [
            CustomTextformfild(
                controller: controller.cruntelinks,
                width: 235.w,
                icon: const Icon(Icons.link),
                title: "حسابات تواصل إجتماعي",
                onFieldSubmitted: (value) {
                  if (value.isNotEmpty) {
                    controller.linkescontact.add(value);
                    print(controller.linkescontact);
                  }
                },
                validator: (val) {
                  if (controller.linkescontact.isEmpty) {
                    return "يجب ادخال رابط حساب تواصل على الأقل";
                  }

                  if (!GetUtils.isURL(val!) && val.isNotEmpty) {
                    return "رابط إلكتروني غير صالح";
                  }
                  return null;
                }),
            IconButton(
              onPressed: () {
                if (controller.cruntelinks.text.isNotEmpty) {
                  controller.addlink(controller.cruntelinks.text);
                  controller.cruntelinks.clear();
                }
              },
              icon: const Icon(
                Icons.add,
              ),
            ),
            IconButton(
                onPressed: () {
                  if (controller.linkescontact.isNotEmpty) {
                    controller.showlistdialog(controller.linkescontact);
                  }
                },
                icon: const Icon(Icons.list))
          ],
        ),
      ],
    );
  }
}
