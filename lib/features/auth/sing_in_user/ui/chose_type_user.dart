import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/features/auth/sing_in_user/ui/widget/body_chose-user.dart';
import 'package:freelanc/features/auth/sing_in_user/ui/widget/bottom_chose_type_user.dart';
import 'package:freelanc/features/auth/sing_in_user/ui/widget/top_chose_user.dart';

// ignore: camel_case_types
class choseTypeUser extends StatelessWidget {
  const choseTypeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const TopChoseUser(),
        SizedBox(
          height: 30.h,
        ),
        const BodyChoseUser(),
        const BottmChosetypeUser(),
      ],
    ));
  }
}
