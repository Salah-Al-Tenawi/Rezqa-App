import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/api/dio_consumer.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/errors/excptions.dart';
import 'package:freelanc/core/functions/uploadimagetoApi.dart';
import 'package:freelanc/core/model/image_model.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/features/client/profile/data/client_modle.dart';
import 'package:get/get.dart';

abstract class ProfileClientReop {
  DioConSumer api = DioConSumer();
  MyServices myServices = Get.find();
  uploadImage(File image);

  getClient(int id);
  //need to token
  saveprofile(String birthdat, String gender, String city, int? imagefrontId,
      int? imagebackId);
  updateProfile(String birthdat, String gender, String city, int? imagefrontId,
      int? imagebackId);
}

class ProfileClientRepoIm extends ProfileClientReop {
  @override
  Future<Either<String, ClientModel>> getClient(int id) async {
    try {
      final response = await api.get("${ApiEndPoint.client}/$id");
      return right(ClientModel.fromJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  @override
  Future<Either<String, ClientModel>> saveprofile(String birthdat,
      String gender, String city, int? imagefrontId, int? imagebackId) async {
    try {
      final response = await api.post(ApiEndPoint.saveclient, header: {
        ApiKey.authorization:
            "Bearer ${myServices.sharedpref.getString(KeyShardpref.token)}"
      }, data: {
        ApiKey.profileImageID: imagefrontId,
        ApiKey.backgroundImageID: imagebackId,
        ApiKey.dataOfBirht: birthdat,
        ApiKey.city: city,
        ApiKey.gender: gender,
      });
      return Right(ClientModel.fromJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  @override
 Future<Either<String ,ClientModel>> updateProfile(String? birthdat, String? gender, String? city,
      int? imagefrontId, int? imagebackId) async {
    try {
      final response = await api.put(ApiEndPoint.saveclient, header: {
        ApiKey.authorization:
            "Bearer ${myServices.sharedpref.getString(KeyShardpref.token)}"
      }, data: {
        ApiKey.profileImageID: imagefrontId,
        ApiKey.backgroundImageID: imagebackId,
        ApiKey.dataOfBirht: birthdat,
        ApiKey.city: city,
        ApiKey.gender: gender,
      });
      return Right(ClientModel.fromJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }
  
  @override
  Future<Either<String, ImageModle>> uploadImage(File image) async {
    try {
      final response = await api.post(ApiEndPoint.storageimage,
          isFomrData: true, data: {'image': await uploadFiletoApi(image)});
     
      return right(ImageModle.fromJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

}
