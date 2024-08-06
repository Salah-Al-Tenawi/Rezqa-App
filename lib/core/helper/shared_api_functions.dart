import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/api/dio_consumer.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/errors/excptions.dart';
import 'package:freelanc/core/functions/get_token.dart';
import 'package:freelanc/core/functions/uploadimagetoApi.dart';
import 'package:freelanc/core/model/file_model.dart';
import 'package:freelanc/core/model/image_model.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/features/auth/models/user_model.dart';
import 'package:get/get.dart';

abstract class ShardApiFuntions {
  DioConSumer api = DioConSumer();
  MyServices myServices = Get.find();

  // functions
  uploadImage(
    File image,
  );
  Future<Either<String, dynamic>> uploadFile(File file, String title);
  whoIam();
}

class SharedApiFunctionIm extends ShardApiFuntions {
  @override
  Future<Either<String, ImageModle>> uploadImage(File image) async {
    try {
      final response = await api.post(ApiEndPoint.storageimage,
          isFomrData: true, data: {ApiKey.image: await uploadFiletoApi(image)});

      return right(ImageModle.fromJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  @override
  Future<Either<String, FileModel>> uploadFile(File file, String title) async {
    String? token = await getToken();
    try {
      final response = await api.post(
          isFomrData: true,
          ApiEndPoint.uploadFile,
          header: {
            ApiKey.authorization: token
          },
          data: {
            ApiKey.file: await uploadFiletoApi(file),
            ApiKey.title: title
          });
      return right(FileModel.formJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  @override
  Future<UserModel?> whoIam() async {
    String? token;
    UserModel? user;
    token = await getToken();
    try {
      final response = await api
          .get(ApiEndPoint.whoIam, header: {ApiKey.authorization: token});
      user = UserModel.fromJson(response);
    } on ServerExpcptions catch (e) {
      Get.snackbar("error", e.errormodel.errormassagr.toString());
    }
    return user;
  }

Future<Either<String, dynamic>> logout() async {
  String ?token;
  token = await getToken();
    try {
      final response = await api.post(ApiEndPoint.logout, header: {
        ApiKey.authorization:token
      });

      return right(response);
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }


}
