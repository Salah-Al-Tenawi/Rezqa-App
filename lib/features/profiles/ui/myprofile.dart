import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/profiles/ui/widget/add_gallary.dart';
import 'package:freelanc/features/profiles/ui/widget/stackimageprofile.dart';

class MyPfofileCompany extends StatelessWidget {
  const MyPfofileCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Stackimageprofile(),
            Text(
              "google",
              style: font25boldblack,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
              // description
              child: Text(
                  textAlign: TextAlign.center,
                  "شركة رائدة في مجال البرمجيات و الأنظمة الذكية وأمن المعلومات  "),
            ),
            Divider(
              color: MyColors.greyColor,
              indent: 60,
              endIndent: 60,
            ),
            Container(
              margin: EdgeInsets.only(top: 20.h),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              width: double.infinity,
              height: 200.h,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Row(children: [
                    Expanded(
                      flex: 1,
                      child: ListTile(
                        // trailing: IconButton(
                        //   icon: Icon(Icons.create),
                        //   onPressed: () {},
                        // ),
                        iconColor: MyColors.blueColor,
                        leading: Icon(Icons.location_on),
                        title: Text("المـوقـع :"),
                        subtitle: Text("دمـشـق / سـوريـا"),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListTile(
                        iconColor: MyColors.blueColor,
                        leading: Icon(Icons.location_city),
                        title: Text("العنوان :"),
                        subtitle: Text("البرامكة -سانا"),
                      ),
                    )
                  ]),
                  ListTile(
                    title: Text("ايميل التواصل :"),
                    subtitle: Text("salahit@gmail.com"),
                    iconColor: MyColors.blueColor,
                    leading: Icon(Icons.email),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        right: 50.w,
                      ),
                      child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Text("0988626577"),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            )

            //  const AddGallary(),
            // MyButton(onPressed: () {

            // }, child: const Text("انطلق للعمل"))
          ],
        ),
      ),
    );
  }
}
