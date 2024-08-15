import 'package:dartz/dartz.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/api/dio_consumer.dart';
import 'package:freelanc/core/errors/excptions.dart';
import 'package:freelanc/core/functions/get_token.dart';
import 'package:freelanc/features/chat/data/all_chat_model.dart';
import 'package:freelanc/features/chat/data/conversation_modle.dart';
import 'package:freelanc/features/chat/data/meassgeModle.dart';

abstract class ChatRepo {
  DioConSumer api = DioConSumer();
  // edit
  creatConversation(int userId);
  sendmessage(int idConversation, String message);
    getmeassges(int idConversation);
  // edit

  getallConversation();
}

class ChatRepoIm extends ChatRepo {
  @override
  Future<Either<String, ConverSationModel>> creatConversation(int userId) async {
    String? token = await getToken();
    try {
      final response = await api.post(ApiEndPoint.conversations,
          header: {ApiKey.authorization: token}, data: {ApiKey.userId: userId});

      return right(ConverSationModel.fromJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  @override
  Future<Either<String, MessageModel>> sendmessage(
      int idConversation, String message) async {
    String? token = await getToken();
    try {
      final response = await api.post(
          "${ApiEndPoint.conversations}/$idConversation/${ApiEndPoint.messages}",
          header: {ApiKey.authorization: token},
          data: {ApiKey.message: message});
      return right(MessageModel.fromJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  @override
  Future<Either<String, List<MessageModel>>> getmeassges(
      int idConversation) async {
    String? token = await getToken();
    try {
      final response = await api.get(
          "${ApiEndPoint.conversations}/$idConversation/${ApiEndPoint.messages}",
          header: {ApiKey.authorization: token});

      return right(MessageModel.messages(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  @override
  Future<Either<String, List<ChatModel>>> getallConversation() async {
    String? token = await getToken();
    try {
      final response = await api.get(ApiEndPoint.conversations,
          header: {ApiKey.authorization: token});
      return right(ChatModel.listChatModel(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }
}
