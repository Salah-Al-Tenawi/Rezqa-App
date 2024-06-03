import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/route/app_routes.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/themes/app_theme.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppRoute appRoute = Get.find();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: GetMaterialApp(
          title: "freelancer projectes with get x",
          getPages: appRoute.list,
          initialRoute: MyRoute.test,
          debugShowCheckedModeBanner: false,
          textDirection: TextDirection.rtl,
          theme: AppTheme.theme),
    );
  }
}
// 2024/5/7 