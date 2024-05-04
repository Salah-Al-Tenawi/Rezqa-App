import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';

class BottmChosetypeUser extends StatelessWidget {
  const BottmChosetypeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 25.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyButton(
            onPressed: () {},
            color: MyColors.blueColor,
            child: Text(
              "التالي",
              style: font15greyebold,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 23.5.h),
            color: MyColors.greyColor,
            width: 100.w,
            height: 111.h,
          ),
        ],
      ),
    );
  }
}
