// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

// ignore: must_be_immutable
class CustomDropdown extends StatelessWidget {
  List<dynamic> items = [];
  String? selectedItem;
  String labelText;
  String? hintText;
  double? top;
  double? bottom;
  double? right;
  double? left;
  bool? showBoxSearch;
  void Function(dynamic)? onChanged;
  Future<List<dynamic>> Function(String)? asyncItems;

  CustomDropdown(
      {super.key,
      this.selectedItem,
      required this.items,
      this.hintText,
      this.bottom,
      this.right,
      this.left,
      this.top,
      this.onChanged,
      this.showBoxSearch,
      this.asyncItems,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: top ?? 0,
            left: left ?? 0,
            right: right ?? 0,
            bottom: bottom ?? 0),
        child: DropdownSearch(
            asyncItems: asyncItems,
            items: items,
            onChanged: (val) {
              onChanged!(val);
            },
            selectedItem: selectedItem,
            popupProps: PopupPropsMultiSelection.menu(
                showSearchBox: showBoxSearch ?? false,
                // isFilterOnline: true
              ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                filled: true,
                fillColor: MyColors.greyColor,
                border: const OutlineInputBorder(),
                labelText: labelText,
              ),
            )));
  }
}
