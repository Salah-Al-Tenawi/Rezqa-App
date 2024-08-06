import 'package:freelanc/core/api/api_end_points.dart';

class ErrorModel {
  final String errormassagr;
   int? statuscode;

  ErrorModel({required this.errormassagr ,this.statuscode});
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(errormassagr: json[ApiKey.massage] ?? json[ApiKey.error] , );
  }
}
