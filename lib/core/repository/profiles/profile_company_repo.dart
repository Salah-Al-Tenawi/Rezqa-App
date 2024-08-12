import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/api/dio_consumer.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/errors/excptions.dart';
import 'package:freelanc/core/functions/get_token.dart';
import 'package:freelanc/core/functions/uploadimagetoApi.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/core/model/image_model.dart';
import 'package:freelanc/features/company/profiles/data/company_model.dart';
import 'package:get/get.dart';

abstract class CompanyprofileRepo {
// setting

  MyServices myServices = Get.find();
  DioConSumer api = DioConSumer();

  //methoed api

  List<Map<String, dynamic>>? allIndutry;
  Future<Either<String, List>> getallindustry(String? name);

  Future<Either<String, CompanyModel>> saveprofile(
      // need token
      String? profileImageID,
      String? backImageProfileID,
      String name,
      String description,
      String industry,
      String streetaddress,
      String city,
      String region,
      String size,
      List? gallaryIDs);

  showcompany(int id);
  // need token
  deletcompany(String password);
  // need token
  Future<Either<String, CompanyModel>> updatecompany(
      String? profileImageID,
      String? backgroundImageID,
      String? name,
      String? description,
      String? size,
      String? city,
      String? region,
      String? streetaddress,
      String ?selectindustry,
      List<int>? gallaryIDs);
  uploadImage(File image);
}

// implemantaion
class CompanyprofileRepoIm extends CompanyprofileRepo {
  @override
  Future<Either<String, List>> getallindustry(String? name) async {
    List list;
    try {
      final response =
          await api.post(ApiEndPoint.getallinustry, data: {"name": name});

      list = response[ApiKey.data].map((item) => item[ApiKey.name]).toList();
      return right(list);
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  @override
  Future<Either<String, CompanyModel>> saveprofile(
      String? profileImageID,
      String? backImageProfileID,
      String name,
      String description,
      String industry,
      String streetaddress,
      String city,
      String region,
      String size,
      List? gallaryIDs) async {
    String? token = await getToken();
    try {
      final response = await api.post(
        ApiEndPoint.savecompany,
        header: {ApiKey.authorization: token},
        data: {
          ApiKey.profileImageID: profileImageID,
          ApiKey.backgroundImageID: backImageProfileID,
          ApiKey.industryname: industry,
          ApiKey.name: name,
          ApiKey.description: description,
          ApiKey.size: size,
          ApiKey.city: city,
          ApiKey.regione: region,
          ApiKey.streetaddress: streetaddress,
          ApiKey.galleryimagesIds: gallaryIDs
        },
      );
      // print(response);
      return right(CompanyModel.fromJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  @override
  Future<Either<String, CompanyModel>> showcompany(int id) async {
    try {
      final response = await api.get("${ApiEndPoint.company}/$id");
      return right(CompanyModel.fromJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> deletcompany(String password) async {
    try {
      final response = await api.delete(ApiEndPoint.company, header: {
        "Authorization":
            "Bearer ${myServices.sharedpref.getString(KeyShardpref.token)}"
      }, data: {
        ApiKey.password: password
      });
      print("response==================================");
      print(response);
      return right(response);
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  @override
  Future<Either<String, CompanyModel>> updatecompany(
      String? profileImageID,
      String? backgroundImageID,
      String? name,
      String? description,
      String? size,
      String? city,
      String? region,
      String? streetaddress,
      String? selectindustry,
      List<int>? gallaryIDs) async {
    try {
      final response = await api.put(ApiEndPoint.company, header: {
        "Authorization":
            "Bearer ${myServices.sharedpref.getString(KeyShardpref.token)}"
      }, data: {
        ApiKey.profileImageID: profileImageID,
        ApiKey.backgroundImageID: backgroundImageID,
        ApiKey.name: name,
        ApiKey.description: description,
        ApiKey.size: size,
        ApiKey.city: city,
        ApiKey.regione: region,
        ApiKey.streetaddress: streetaddress,
        ApiKey.industryname: selectindustry,
        ApiKey.galleryimages: gallaryIDs
      });

      return right(CompanyModel.fromJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  @override
  Future<Either<String, ImageModle>> uploadImage(File image) async {
    try {
      final response = await api.post(ApiEndPoint.storageimage,
          isFomrData: true, data: {ApiKey.image: await uploadFiletoApi(image)});
      print(response);
      return right(ImageModle.fromJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  List<Map<String, dynamic>> formatGalleryIds(List<dynamic> list) {
    return list.map((item) => {"id": item}).toList();
  }
}
