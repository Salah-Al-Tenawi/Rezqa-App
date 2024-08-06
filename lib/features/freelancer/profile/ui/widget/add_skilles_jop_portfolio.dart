// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/functions/input_valid.dart';
import 'package:freelanc/core/model/skilles_model.dart';
import 'package:freelanc/core/themes/color_app.dart';

import 'package:freelanc/core/widgets/mltui_dropdown.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_portfolio_controller.dart';

// ignore: must_be_immutable
class AddSkillesJopPortfolio extends StatelessWidget {
  FreelancerPortfolioControllerIm controllerIm;
  AddSkillesJopPortfolio({
    super.key,
    required this.controllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: DropdownSearch<SkilleModel>.multiSelection(
        selectedItems: controllerIm.skilles,
        asyncItems: (String filter) {
          return controllerIm.getListSkilles(filter);
        },
        itemAsString: (SkilleModel skilles) => skilles.name!,
        onChanged: (List<SkilleModel> selectedItems) {
          controllerIm.skilles = selectedItems;
          print(controllerIm.skilles.map((e) => e.id).toList());
        },
        popupProps: const PopupPropsMultiSelection.menu(
          showSearchBox: true,
        ),
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            hintText: "المهارات المستعملة ",
            filled: true,
            fillColor: MyColors.greyColor,
            border: const OutlineInputBorder(),
          ),
        ),
        validator: (List<SkilleModel>? selectSkilles) =>
          validateSkills(selectSkilles)
        ,
      ),
    );
  }
}

