import 'package:dio/dio.dart';
import 'package:freelanc/core/api/api_consumer.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/api/api_interceptor.dart';
import 'package:freelanc/core/errors/excptions.dart';
import 'package:get/get.dart';

class DioConSumer extends ApiConSumer {
  late Dio dio;
  DioConSumer() {
    dio = Get.put(Dio());

    dio.options.baseUrl = ApiEndPoint.basrurl;
    
    dio.interceptors.add(ApiInterCeptor());
    dio.interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        error: true));
  }

  @override
  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response =
          await dio.post(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handelDioExcptions(e);
    }
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handelDioExcptions(e);
    }
  }

  @override
  Future get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response =
          await dio.get(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handelDioExcptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response =
          await dio.patch(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handelDioExcptions(e);
    }
  }
}
