import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/features/profiles/ui/widget/imageback_front_profile.dart';

class Stackimageprofile extends StatelessWidget {
  const Stackimageprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Imagebackground(),
            ));
          },
          child: Container(
            width: double.infinity,
            height: 250.h,
            child: Hero(
              tag: 'profileImage',
              child: Image.asset(
                ImagesUrl.imagetest, // احلي صورة هنا
                fit: BoxFit.cover, // حجم الصورة المصغرة
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(top: 125.h, bottom: 10.h),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ImageFront(),
                  ));
                },
                child: CircleAvatar(
                  backgroundColor: MyColors.blueColor,
                  radius: 90,
                  backgroundImage: AssetImage(ImagesUrl.imagetest),
                ),
              ),
            ),
          
          ]),
        ),
      ],
    );
  }
}
