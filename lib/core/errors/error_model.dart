import 'package:freelanc/core/api/api_end_points.dart';

class ErrorModel {
  final String errormassagr;

  ErrorModel({required this.errormassagr});
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(errormassagr: json[ApiKey.massage] ?? json['error']);
  }
}
