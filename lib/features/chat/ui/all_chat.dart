import 'package:flutter/material.dart';
import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/custom_badge.dart';
import 'package:freelanc/core/widgets/custom_listtile.dart';

class AllCaht extends StatelessWidget {
  const AllCaht({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.blueColor,
          title: Text(
            "الدردشات",
            style: font17greynormal,
          ),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, int) {
              return CustomListTile(
                title: "الياهمالالي ",
                iconleading: CircleAvatar(
                  backgroundColor: MyColors.greyColor,
                  child: Image.asset(ImagesUrl.imagetest),
                ),
                trailing: CustomBadge(
                  badgeColor: Colors.red,
                  border: true,
                ),
                subtitle: Text("مرحبا خيو معك محسن من الدرعية"),
                onTap: () {},
              );
            }));
  }
}
