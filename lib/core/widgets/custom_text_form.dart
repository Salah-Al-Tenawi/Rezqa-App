import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';

// ignore: must_be_immutable
class CustomTextformfild extends StatelessWidget {
  TextEditingController ?controller = TextEditingController();
  String? Function(String?)? validator;
  void Function(String)? onFieldSubmitted;
  String title;
  Icon? icon;
  Widget? suffix;
  bool? scureText;
  TextInputType? keyboardType;
  String? hint;
  double? height;
  double? width;

  CustomTextformfild(
      {super.key,
      this.height,
      this.width,
      required this.title,
       this.controller,
      this.icon,
      this.suffix,
      this.onFieldSubmitted,
      required this.validator,
      this.keyboardType,
      this.scureText,
      this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: TextFormField( 
        
        onFieldSubmitted: onFieldSubmitted,
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
