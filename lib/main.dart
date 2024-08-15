import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/binding/chat_binding.dart';
import 'package:freelanc/core/route/app_routes.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/themes/app_theme.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initalservices();
  runApp(const MyApp());
}

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
          initialRoute: MyRoute.onboarding,
          initialBinding: ChatBindings(),
          debugShowCheckedModeBanner: false,
          textDirection: TextDirection.rtl,
          theme: AppTheme.lighttheme),
    );
  }
}
// 2024/5/7 