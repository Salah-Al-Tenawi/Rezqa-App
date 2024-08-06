import 'package:dartz/dartz.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/api/dio_consumer.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/errors/excptions.dart';
import 'package:freelanc/core/model/joprole_model.dart';
import 'package:freelanc/core/model/skilles_model.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/features/freelancer/profile/data/freelancer_model.dart';
import 'package:get/get.dart';

abstract class ProfileFreeLancerRepo {
  DioConSumer api = DioConSumer();
  MyServices myServices = Get.find();
  // methods
  getFreelancer(int id);
  saveFreelancer(
      String? profileImageID,
      String? backImageProfileID,
      String description,
      int jopRoleId,
      String dateOfbirth,
      String city,
      String gender,
      String headline,
      List<int>? skillsIds);

  updateFreelancer(
      String? profileImageID,
      String? backImageProfileID,
      String description,
      int jopRoleId,
      String dateOfbirth,
      String city,
      String gender,
      String headline,
      List<int>? skillsIds);
  searchJoprole(String name);
  searchSkilles(String name);
}

class ProfileFreelancerRepoImp extends ProfileFreeLancerRepo {
  @override
  Future<Either<String, FreelancerModel>> getFreelancer(int id) async {
    try {
      final response = await api.get("${ApiEndPoint.freelnacer}/$id");
      return right(FreelancerModel.fromJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  @override
  Future<Either<String, FreelancerModel>> saveFreelancer(
      String? profileImageID,
      String? backImageProfileID,
      String description,
      int jopRoleId,
      String dateOfbirth,
      String city,
      String gender,
      String headline,
      List<int>? skillsIds) async {
    try {
      final response = await api.post(ApiEndPoint.savefreelnacer, header: {
        "Authorization":
            "Bearer ${myServices.sharedpref.getString(KeyShardpref.token)}"
      }, data: {
        ApiKey.profileImageID: profileImageID,
        ApiKey.backgroundImageID: backImageProfileID,
        ApiKey.description: description,
        ApiKey.joproleId: jopRoleId,
        ApiKey.dataOfBirht: dateOfbirth,
        ApiKey.city: city,
        ApiKey.gender: gender,
        ApiKey.headline: headline,
        ApiKey.skillsId: skillsIds
      });
      return right(FreelancerModel.fromJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  @override
  Future<Either<String, FreelancerModel>> updateFreelancer(
      String? profileImageID,
      String? backImageProfileID,
      String description,
      int jopRoleId,
      String dateOfbirth,
      String city,
      String gender,
      String headline,
      List<int>? skillsIds) async {
    try {
      final response = await api.put(ApiEndPoint.freelnacer, header: {
        "Authorization":
            "Bearer ${myServices.sharedpref.getString(KeyShardpref.token)}"
      }, data: {
        ApiKey.profileImageID: profileImageID,
        ApiKey.backgroundImageID: backImageProfileID,
        ApiKey.description: description,
        ApiKey.joproleId: jopRoleId,
        ApiKey.dataOfBirht: dateOfbirth,
        ApiKey.city: city,
        ApiKey.gender: gender,
        ApiKey.headline: headline,
        ApiKey.skillsId: skillsIds
      });
      return right(FreelancerModel.fromJson(response));
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  @override
  Future<List<JoproleModel>> searchJoprole(String name) async {
    try {
      final response =
          await api.post(ApiEndPoint.getjoprloe, data: {ApiKey.name: name});

      return JoproleModelList.fromJson(response).data ?? [];
    } on ServerExpcptions catch (e) {
      Get.snackbar("error", e.errormodel.errormassagr.toString());
    }
    return [];
  }

  // @override
  // Future<Either<String, SkilleModelList>> searchSkilles(String? name) async {
  //   try {
  //     final response =
  //         await api.post(ApiEndPoint.getskilles, data: {ApiKey.name: name});

  //     return right(SkilleModelList.fromJson(response));
  //   } on ServerExpcptions catch (e) {
  //     return left(e.errormodel.errormassagr.toString());
  //   }
  // }

  @override
  Future<List<SkilleModel>> searchSkilles(String? name) async {
    try {
      final response =
          await api.post(ApiEndPoint.getskilles, data: {ApiKey.name: name});

      return SkilleModelList.fromJson(response).data ?? [];
    } on ServerExpcptions catch (e) {
      Get.snackbar("error", e.errormodel.errormassagr.toString());
    }
    return [];
  }
}
