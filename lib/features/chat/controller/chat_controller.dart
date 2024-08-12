import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/repository/chat_repository.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

abstract class ChatController extends GetxController {
  ChatRepoIm chatRepoIm = Get.put(ChatRepoIm());
  RxList messages = <Map<String, String>>[].obs;
  MyServices myServices = Get.find();

  final TextEditingController messagecontroller = TextEditingController();

  // sendMessage(int idConverSation, String message);
  // getMessage();
  createConversation(int userId);
  // getAllConversation();
}

class ChatControllerIm extends ChatController {
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  createConversation(int userId) async {
    final response = await chatRepoIm.creatConversation(userId);
    response.fold((error) {
      Get.snackbar("error", error);
    }, (responseDynamic) {
      Get.snackbar("حجي", " زبط التابع وعملو مودل ");
      print(responseDynamic);
    });
  }
}




