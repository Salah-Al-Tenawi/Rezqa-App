// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/themes/color_app.dart';

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  String? title;
  Widget? subtitle;
  Icon? iconleading;
  Widget? trailing;
  bool? isThreeLine;
  bool? paddingsub = true;
  double? width;
  double? height;
  TextStyle? titleTextStyle;
  EdgeInsetsGeometry? padding;
  void Function()? onTap;

  CustomListTile(
      {super.key,
      this.padding,
      this.titleTextStyle,
      this.onTap,
      this.isThreeLine,
      required this.title,
      this.subtitle,
      this.height,
      this.width,
      this.paddingsub,
      this.iconleading,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      child: ListTile(
        iconColor: MyColors.blueColor,
        isThreeLine: isThreeLine ?? false,
        trailing: trailing,
        leading: iconleading,
        title: Text(title!),
        titleTextStyle: titleTextStyle,
        subtitle: paddingsub == true
            ? Padding(
                padding: EdgeInsets.only(
                  right: 80.w,
                ),
                child: subtitle)
            : subtitle,
        onTap: onTap,
      ),
    );
  }
}
