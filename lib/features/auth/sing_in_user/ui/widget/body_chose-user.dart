import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/features/auth/sing_in_user/data/static_data_user_type.dart';
import 'package:get/get.dart';

class BodyChoseUser extends StatelessWidget {
  const BodyChoseUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20.h),
          color: MyColors.blueColor,
          width: 330.w,
          height: 130.h,
          child: ListTile(
            title: Text(
              listChosetypesuerModel[0].typeuser,
              style: font22greyebold,
            ),
            subtitle: Text(
              listChosetypesuerModel[0].descrtypeuser,
              style: font14greynormal,
            ),
            leading: listChosetypesuerModel[0].icon,
            onTap: () {},
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20.h),
          color: MyColors.blueColor,
          width: 330.w,
          height: 130.h,
          child: ListTile(
            title: Text(
              listChosetypesuerModel[1].typeuser,
              style: font22greyebold,
            ),
            subtitle: Text(
              listChosetypesuerModel[1].descrtypeuser,
              style: font14greynormal,
            ),
            leading: listChosetypesuerModel[1].icon,
            onTap: () {
              Get.toNamed(MyRoute.infoprofilecompanyone);
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20.h),
          color: MyColors.blueColor,
          width: 330.w,
          height: 130.h,
          child: ListTile(
            title: Text(
              listChosetypesuerModel[2].typeuser,
              style: font22greyebold,
            ),
            subtitle: Text(
              listChosetypesuerModel[2].descrtypeuser,
              style: font14greynormal,
            ),
            leading: listChosetypesuerModel[2].icon,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
// ...List.generate(listChosetypesuerModel.length, (index) {
//           return Container(
//             margin: EdgeInsets.only(bottom: 20.h),
//             color: MyColors.blueColor,
//             width: 330.w,
//             height: 130.h,
//             child: ListTile(
//               title: Text(listChosetypesuerModel[index].typeuser),
//               subtitle: Text(listChosetypesuerModel[index].descrtypeuser),
//               leading: listChosetypesuerModel[index].icon,
//             ),
//           );
//         })