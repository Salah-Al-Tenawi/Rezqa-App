import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/api/dio_consumer.dart';
import 'package:freelanc/core/errors/excptions.dart';
import 'package:freelanc/features/auth/models/user_model.dart';
import 'package:dartz/dartz.dart';

class UserRepositry {
  static UserModel? user;
  static String? token;
  DioConSumer dio = DioConSumer();

  Future<Either<String, UserModel>> sigin(String firstname, String lastname,
      String email, String password, String repassword) async {
    try {
      final response = await dio.post(ApiEndPoint.register, data: {
        ApiKey.firstname: firstname,
        ApiKey.lastname: lastname,
        ApiKey.password: password,
        ApiKey.configpassword: repassword,
        ApiKey.email: email,
      });
      return Right(UserModel.fromJson(response));
    } on ServerExpcptions catch (e) {
      return Left(e.errormodel.errormassagr.toString());
    }
  }

  Future<Either<String, dynamic>> verfiyemail(String email, String otp) async {
    try {
      final response = await dio.post(ApiEndPoint.emailverify, data: {
        ApiKey.email: email,
        ApiKey.emailotp: otp,
      });

      return Right(response);
    } on ServerExpcptions catch (e) {
      return Left(e.errormodel.errormassagr.toString());
    }
  }

  Future<Either<String, dynamic>> resendotp(String email) async {
    try {
      final response =
          await dio.post(ApiEndPoint.resendOtp, data: {ApiKey.email: email});
      return Right(response);
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  Future<Either<String, dynamic>> login(String email, String password) async {
    try {
      final respone = await dio.post(ApiEndPoint.login,
          data: {ApiKey.email: email, ApiKey.password: password});

      return Right(respone);
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  // user forgetr password
  Future<Either<String, dynamic>> forgetpassword(String email) async {
    try {
      final response = await dio
          .post(ApiEndPoint.fogetpassword, data: {ApiKey.email: email});
      return Right(response);
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr.toString());
    }
  }

  Future<Either<String, dynamic>> resetpassword(
      String email, String password, String repassword, String otp) async {
    try {
      final response = await dio.post(ApiEndPoint.restpassword, data: {
        ApiKey.email: email,
        ApiKey.password: password,
        ApiKey.configpassword: repassword,
        ApiKey.otpcode: otp
      });
      return Right(response);
    } on ServerExpcptions catch (e) {
      return left(e.errormodel.errormassagr);
    }
  }
  
}
