import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';

// ignore: must_be_immutable
class CustomTextformfild extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String? Function(String?)? validator;
  String title;
  Icon? icon;
  bool? scureText;
  TextInputType? keyboardType;

  CustomTextformfild({
    super.key,
    required this.title,
    required this.controller,
    this.icon,
    required this.validator,
    this.keyboardType,
    this.scureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: scureText == null || scureText == false ? false : true,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            fillColor: MyColors.greyTextfildColor,
            labelText: title,
            labelStyle: TextStyle(
              fontSize: 14,
              color: MyColors.blackColor,
            ),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            prefixIcon: icon),
      ),
    );
  }
}
