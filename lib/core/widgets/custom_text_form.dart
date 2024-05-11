import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';

// ignore: must_be_immutable
class CustomTextformfild extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String? Function(String?)? validator;
  String title;
  Icon? icon;
  Widget? suffix;
  bool? scureText;
  TextInputType? keyboardType;
  String? hint;

  CustomTextformfild(
      {super.key,
      required this.title,
      required this.controller,
      this.icon,
      this.suffix,
      required this.validator,
      this.keyboardType,
      this.scureText,
      this.hint});

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
            hintText: hint,
            suffix: suffix,
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
