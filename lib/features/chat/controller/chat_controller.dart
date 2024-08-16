import 'dart:async';

import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/repository/chat_repository.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/features/chat/data/all_chat_model.dart';
import 'package:freelanc/features/chat/data/conversation_modle.dart';
import 'package:freelanc/features/chat/data/meassgeModle.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

abstract class ChatController extends GetxController {
  ChatRepoIm chatRepoIm = Get.put(ChatRepoIm());
  // RxList messages = <Map<String, String>>[].obs;
  MyServices myServices = Get.find();

  sendMessage(int idConverSation, String message);
  getMessage(int idConverstaion);
  createConversation(int userId);
  getAllConversation();
  void scrollToBottom();
}

class ChatControllerIm extends ChatController {
  final TextEditingController messagecontroller = TextEditingController();
  // RxList allConversation = [].obs;
  RxList<MessageModel> messages = <MessageModel>[].obs;
  RxList<String> messageString = <String>[].obs;
  ConverSationModel? converSationModel;
  final ScrollController scrollController = ScrollController();

  bool? isSender;
  int? myid;
  Timer? timer;
  @override
  void onInit() async {
    myid = myServices.sharedpref.getInt(KeyShardpref.roleID);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    timer = Timer.periodic(const Duration(seconds: 7), (Timer t) {
      if (converSationModel != null) {
        getMessage(converSationModel!.id!);
      }
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  @override
  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  createConversation(int userId) async {
    final response = await chatRepoIm.creatConversation(userId);
    response.fold((error) {
      Get.snackbar("error", error);
    }, (conversation) {
      converSationModel = conversation;
      print(converSationModel!.participants![0].userId);
      Get.toNamed(MyRoute.chat);
    });
  }

  @override
  getMessage(int idConverstaion) async {
    final response = await chatRepoIm.getmeassges(idConverstaion);
    response.fold((error) => Get.snackbar("erroe", error), (listMessages) {
      messages.value = listMessages;
      scrollToBottom();
    });
  }

  @override
  Future<List<ChatModel>> getAllConversation() async {
    List<ChatModel> conversations = [];
    final response = await chatRepoIm.getallConversation();
    response.fold((error) => Get.snackbar("error", error),
        (listOfConverSationModel) async {
      conversations = listOfConverSationModel;
    });
    return conversations;
  }

  @override
  sendMessage(int idConverSation, String message) async {
    final response = await chatRepoIm.sendmessage(idConverSation, message);
    response.fold((error) => Get.snackbar("error", error),
        (messageModel) => {messages.add(messageModel)});
  }
}
