// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/model/file_model.dart';

import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/widgets/custom_listtile.dart';


// ignore: must_be_immutable
class ShowFilesPortfolio extends StatelessWidget {
  List<FileModel> files;
  int lenghtList;
   ShowFilesPortfolio({
    super.key,
    required this.files,
    required this.lenghtList,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(lenghtList, (index) {
        return CustomListTile(
          onTap: () {
            // print(index);
          },
          title: files[index].extention,
          subtitle: Text(files[index].url??""),
          color: MyColors.greyColor,
          // padding: EdgeInsets.all(50),
          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),

          iconleading: const Icon(Icons.file_copy),
        );
      }),
    );
  }
}
