import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:get/get.dart';

showSizeWarning() {
  Get.defaultDialog(
      backgroundColor: MyColors.blueColor,
      titleStyle: font17greyw600,
      
      radius: 10,
      title: "فشل التحميل",
      content: Text(
        "حجم الملف اكبر من المسموح به \n حاول مجددا",
        textAlign: TextAlign.center,
        style: font15whitebold,
      ));
}
 
 

