
import 'package:dartz/dartz.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/api/dio_consumer.dart';
import 'package:freelanc/core/errors/excptions.dart';
import 'package:freelanc/core/functions/get_token.dart';
import 'package:freelanc/features/chat/data/message_model.dart';

abstract class ChatRepo {
  DioConSumer api = DioConSumer();
  creatConversation(int userId);
  sendmessage(int idConversation, String message);
  getmeassge(int idConversation);
  getallConversation();
}

class ChatRepoIm extends ChatRepo {
  @override
  Future<Either<String, dynamic>> creatConversation(int userId) async {
    String? token = await getToken();
    try {
      final response = await api.post(ApiEndPoint.conversations,
          header: {ApiKey.authorization: token}, data: {ApiKey.userId: userId});

      return right(response);
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
  Future<Either<String, MessageModel>> getmeassge(int idConversation) async {
    String? token = await getToken();
    try {
      final response = await api.get(
          "${ApiEndPoint.conversations}/$idConversation/${ApiEndPoint.messages}",
          header: {ApiKey.authorization: token});

      return right(MessageModel.fromJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> getallConversation() async {
    String? token = await getToken();
    try {
      final response = await api.get(ApiEndPoint.conversations ,header: { 
        ApiKey.authorization:token
      });
      return right(response);
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }
}
