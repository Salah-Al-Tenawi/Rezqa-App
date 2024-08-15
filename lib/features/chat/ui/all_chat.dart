import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/custom_badge.dart';
import 'package:freelanc/core/widgets/custom_listtile.dart';
import 'package:freelanc/features/chat/controller/chat_controller.dart';
import 'package:freelanc/features/chat/data/all_chat_model.dart';
import 'package:freelanc/features/chat/data/conversation_modle.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AllCaht extends StatelessWidget {
  const AllCaht({super.key});

  @override
  Widget build(BuildContext context) {
    ChatControllerIm controller = Get.put(ChatControllerIm());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.blueColor,
          title: Text(
            "الدردشات",
            style: font17greynormal,
          ),
        ),
        body: FutureBuilder<List<ChatModel>>(
            future: controller.getAllConversation(),
            builder: (buildContext, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Lottie.asset(ImagesUrl.loadingLottie2));
              } else if (snapshot.hasError) {
                return Center(
                    child: Center(child: Text('Error: ${snapshot.error}')));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                    child: Text(
                  'لا يوجد محادثات',
                ));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final chat = snapshot.data![index];
                      return Column(
                        children: [
                          CustomListTile(
                            title: chat.username,
                            iconleading: CircleAvatar(
                              backgroundColor: MyColors.greyColor,
                              // child: chat.profileImage==""?
                            ),
                            trailing: CustomBadge(
                              badgeColor: Colors.red,
                              border: true,
                              child: Text(chat.deteLastmessage),
                            ),
                            subtitle: Text(chat.lastMessage),
                            onTap: () async {
                              // print(chat.conversationId);
                              await controller
                              .createConversation(chat.iduser);
                              // Get.toNamed(MyRoute.chat);
                            },
                          ),
                          Divider(
                            endIndent: 50.w,
                            indent: 50,
                            color: MyColors.greyColor,
                          )
                        ],
                      );
                    });
              }
            }));
  }
}
