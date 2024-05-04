import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/app_routes.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/themes/app_theme.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppRoute controller = Get.find();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: GetMaterialApp(
          title: "freelancer projectes with get x ",
          getPages: controller.list,
          initialRoute: MyRoute.login,
          debugShowCheckedModeBanner: false,
          textDirection: TextDirection.rtl,
          theme: AppTheme.them),
    );
  }
}
