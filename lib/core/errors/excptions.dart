import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:freelanc/core/errors/error_model.dart';
import 'package:get/get.dart';

class ServerExpcptions implements Exception {
  final ErrorModel errormodel;

  ServerExpcptions({required this.errormodel});
}

void handelDioExcptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerExpcptions(errormodel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.sendTimeout:
      throw ServerExpcptions(errormodel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.receiveTimeout:
      throw ServerExpcptions(errormodel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.badCertificate:
      throw ServerExpcptions(errormodel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.cancel:
      throw ServerExpcptions(errormodel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.connectionError:
      throw ServerExpcptions(errormodel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.unknown:
      throw ServerExpcptions(errormodel: ErrorModel.fromJson(e.response!.data));

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
          throw ServerExpcptions(
              errormodel: ErrorModel.fromJson(
                  {"message": "مشكلة في الخادم حاول في وقت آخر"}));
      }
  }
}
    //عامل ايميل
//         {
//     "message": "The email has already been taken.",
//     "errors": {
//         "email": [
//             "The email has already been taken."
//         ]
//     }
// }
// password غلط تأكسد
//{
//     "message": "The password field confirmation does not match. (and 1 more error)",
//     "errors": {
//         "password": [
//             "The password field confirmation does not match.",
//             "The password field must be at least 8 characters."
//         ]
//     }
// }