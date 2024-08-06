// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/functions/input_valid.dart';

import 'package:freelanc/core/model/joprole_model.dart';
import 'package:freelanc/core/model/skilles_model.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_profile_controller.dart';

// ignore: must_be_immutable
class SkillesAndJoprole extends StatelessWidget {
  FreeProfileControllerIm controller;
  SkillesAndJoprole({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          DropdownSearch<JoproleModel>(
              asyncItems: (String filter) => controller.searchJoprole(filter),
              itemAsString: (JoproleModel joproleModel) => joproleModel.name!,
              onChanged: (JoproleModel? selectjop) {
                controller.joproleModel = selectjop!;
              },
              selectedItem: controller.joproleModel,
              popupProps: const PopupPropsMultiSelection.menu(
                showSearchBox: true,
              ),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  hintText: "اختر تخصصك",
                  filled: true,
                  fillColor: MyColors.greyColor,
                  border: const OutlineInputBorder(),
                ),
              ),
              validator: (JoproleModel? joprole) => validatJoprole(joprole)),
          SizedBox(
            height: 30.h,
          ),
          DropdownSearch<SkilleModel>.multiSelection(
            selectedItems: controller.skilles,
            asyncItems: (String filter) {
              return controller.getListSkilles(filter);
            },
            itemAsString: (SkilleModel skilles) => skilles.name!,
            onChanged: (List<SkilleModel> selectedItems) {
              controller.skilles = selectedItems;
            },
            popupProps: const PopupPropsMultiSelection.menu(
              showSearchBox: true,
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                hintText: "اختر مهاراتك",
                filled: true,
                fillColor: MyColors.greyColor,
                border: const OutlineInputBorder(),
              ),
            ),
            validator: (List<SkilleModel>? selectedItems) =>
                validateSkills(selectedItems),
          ),
        ],
      ),
    );
  }
}
