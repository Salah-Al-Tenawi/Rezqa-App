import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/route/routes.dart';

import 'package:freelanc/features/auth/sing_in_user/data/static_data_user_type.dart';
import 'package:freelanc/features/auth/sing_in_user/ui/widget/custom_button_chose_user.dart';
import 'package:freelanc/features/company/profiles/ui/widget/style_profile.dart';
import 'package:get/get.dart';

class BodyChoseUser extends StatelessWidget {
  const BodyChoseUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButtonChoseuser(
            title: listChosetypesuerModel[0].typeuser,
            subtitle: listChosetypesuerModel[0].descrtypeuser,
            icon: listChosetypesuerModel[0].icon),
        CustomButtonChoseuser(
            onTap: () {
              Get.toNamed(MyRoute.infoprofilecompanyone);
            },
            title: listChosetypesuerModel[1].typeuser,
            subtitle: listChosetypesuerModel[1].descrtypeuser,
            icon: listChosetypesuerModel[1].icon),
        CustomButtonChoseuser(
            title: listChosetypesuerModel[2].typeuser,
            subtitle: listChosetypesuerModel[2].descrtypeuser,
            icon: listChosetypesuerModel[2].icon),
        SizedBox(
          height: 40.h,
        ),
        StyleInfoProfile(
          alignment: Alignment.bottomLeft,
          criculartopright: true,
        ),
      ],
    );
  }
}
