import 'package:dio/dio.dart';
import 'package:freelanc/core/errors/error_model.dart';

class ServerExpcptions implements Exception {
  final ErrorModel errormodel;

  ServerExpcptions({required this.errormodel});
}

void handelDioExcptions(DioException e) {
  Map<String, String> errorconect = {"message": "مشكلة في الإتصال بالإنترنـت"};
  Map<String, String> errorservir = {
    "message": "مشكلة في الخادم حاول في وقت آخر"
  };
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerExpcptions(errormodel: ErrorModel.fromJson(errorconect));

    case DioExceptionType.sendTimeout:
      throw ServerExpcptions(errormodel: ErrorModel.fromJson(errorconect));

    case DioExceptionType.receiveTimeout:
      throw ServerExpcptions(errormodel: ErrorModel.fromJson(errorconect));

    case DioExceptionType.badCertificate:
      throw ServerExpcptions(errormodel: ErrorModel.fromJson(errorconect));

    case DioExceptionType.cancel:
      throw ServerExpcptions(errormodel: ErrorModel.fromJson(errorconect));

    case DioExceptionType.connectionError:
      throw ServerExpcptions(errormodel: ErrorModel.fromJson(errorconect));

    case DioExceptionType.unknown:
      throw ServerExpcptions(errormodel: ErrorModel.fromJson(errorconect));

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 302:
          throw ServerExpcptions(
              errormodel: ErrorModel.fromJson(e.response!.data));

        case 422:
          throw ServerExpcptions(
              errormodel: ErrorModel.fromJson(e.response!.data));

        case 401:
          throw ServerExpcptions(
              errormodel: ErrorModel.fromJson(e.response!.data));

        case 502:
          throw ServerExpcptions(errormodel: ErrorModel.fromJson(errorservir));
      }
  }
}
