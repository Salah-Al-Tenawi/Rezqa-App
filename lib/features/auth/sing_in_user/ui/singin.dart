import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/features/auth/sing_in_user/controller/singin_controller.dart';
import 'package:freelanc/features/auth/sing_in_user/ui/widget/cloumn_my_button_singin.dart';
import 'package:freelanc/features/auth/sing_in_user/ui/widget/column_custom_textformfild_singin.dart';
import 'package:freelanc/features/auth/sing_in_user/ui/widget/singin_top_cric_text.dart';
import 'package:get/get.dart';

class SinginScreen extends StatelessWidget {
  const SinginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SinginControllerIm controller = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formkeysing,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TopsinginTextCriuc(),
                SizedBox(
                  height: 40.h,
                ),
                 ColumnCustomTextformfildSingin(controller: controller,),
                 ColumnMyButtonSingin(controller: controller,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
