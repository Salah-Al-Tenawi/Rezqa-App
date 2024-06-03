import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/custom_listtile.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class TestWidgets extends StatelessWidget {
  const TestWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    TestController controller = Get.put(TestController());
    return Scaffold(
        body: Center(
            child: Obx(() => controller.isloading == false.obs
                ? MyButton(
                    onPressed: () {
                      controller.lodanig();
                    },
                    child: const Icon(Icons.login))
                : CircularProgressIndicator(
                    color: Colors.red,
                  ))));
  }
}

class TestController extends GetxController {
  RxBool isloading = false.obs;
  lodanig() {
    isloading = true.obs;
    update();
  }

  var birthday = 'اختر الوقت';
  List<String> skilles = [
    "html",
    "flutter",
    "php",
    "java",
    "three.js",
    "opengl",
    "prolog",
    "css",
    "kotlin"
  ];
}
