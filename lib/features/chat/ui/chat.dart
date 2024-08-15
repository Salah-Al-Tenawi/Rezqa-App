import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/functions/show_full_image.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/chat/controller/chat_controller.dart';
import 'package:freelanc/features/chat/data/paticipants_model.dart';
import 'package:freelanc/features/chat/ui/widget/body_chat.dart';
import 'package:freelanc/features/chat/ui/widget/chat_appbar.dart';
import 'package:freelanc/features/chat/ui/widget/text_form_wiht_button_chat.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Chat extends StatelessWidget {
  String? urlImage;
  List<ParticipantsModel>? users;
  String? name;
  Chat({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatControllerIm controller = Get.put(ChatControllerIm());
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

    return Scaffold(
      appBar:
      AppBarChat(
          controller: controller,
        ),
      body: Column(
        children: [
          ChatBody(
            controller: controller,
          ),
          TextFromWithBottomCaht(
            messagecontroller: controller.messagecontroller,
            onPressed: () {
              if (controller.messagecontroller.text.isNotEmpty) {
                controller.sendMessage(controller.converSationModel!.id!,
                    controller.messagecontroller.text);
                controller.scrollToBottom();
                controller.messagecontroller.clear();
              }
            },
          ),
          MyButton(
              onPressed: () async {
                // print(controller.converSationModel!.id);
                await controller.getMessage(controller.converSationModel!.id!);
                
              },
              child: const Text("getmessages"))
        ],
      ),
    );
  }
}
