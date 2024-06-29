import 'package:freelanc/core/api/api_end_points.dart';

class UserModel {
  int? id;
  String? username;
  String? firstname;
  String? lastname;
  String? email;
  String? role;
  int? roleId;
  String? token;

  UserModel({this.email, this.firstname, this.id, this.lastname, this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json[ApiKey.user][ApiKey.id] ?? 0;
    username = json[ApiKey.user][ApiKey.username] ?? "";
    firstname = json[ApiKey.user][ApiKey.firstname] ?? "";
    lastname = json[ApiKey.user][ApiKey.lastname] ?? "";
    email = json[ApiKey.user][ApiKey.email] ?? "";
    role = json[ApiKey.user][ApiKey.role] ?? "";
    roleId = json[ApiKey.user][ApiKey.roleId] ?? 0;
    token = json[ApiKey.token] ?? "";
  }
}
