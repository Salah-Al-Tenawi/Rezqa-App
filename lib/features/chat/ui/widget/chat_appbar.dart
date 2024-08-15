// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/functions/show_full_image.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/chat/controller/chat_controller.dart';
import 'package:freelanc/features/chat/data/paticipants_model.dart';

// ignore: must_be_immutable
class AppBarChat extends StatelessWidget implements PreferredSizeWidget {
  ChatControllerIm controller;
  String? urlImage;
  List<ParticipantsModel>? users;
  String? name;
  AppBarChat({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    users = controller.converSationModel?.participants;
    print("==============================================");
    print(users![0].userId);
    print("==============================================");
    urlImage = users![0].userId == controller.myid
        ? users![1].profileImageUrl
        : users![0].profileImageUrl;
    name = users![0].userId == controller.myid
        ? users![1].username
        : users![0].username!;

    return AppBar(
      backgroundColor: MyColors.blueColor,
      actions: [
        MyButton(
          onPressed: () {
            if (urlImage != null) {
              showFullImage(urlImage!);
            }
          },
          child: CircleAvatar(
            backgroundColor: MyColors.greyColor,
            radius: 45,
            backgroundImage: urlImage == null
                ? const AssetImage(ImagesUrl.imagetest)
                : NetworkImage(urlImage!) as ImageProvider,
          ),
        ),
        // SizedBox(width: 5.w),
        Expanded(
          child: Text(
            name ?? "",
            style: font17greynormal,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        PopupMenuButton<String>(
          onSelected: (value) {},
          itemBuilder: (context) => [
            const PopupMenuItem(value: "Settings", child: Text("حظر")),
            // const PopupMenuItem(value: "Logout", child: Text("Logout")),
          ],
        ),
        SizedBox(width: 10.w),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
