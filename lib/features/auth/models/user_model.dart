import 'package:freelanc/core/api/api_end_points.dart';

class UserModel {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
 
  UserModel({this.email, this.firstname, this.id, this.lastname,});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json[ApiKey.user][ApiKey.userid] ?? 0;
    firstname = json[ApiKey.user][ApiKey.firstname] ?? "";
    lastname = json[ApiKey.user][ApiKey.lastname] ?? "";
    email = json[ApiKey.user][ApiKey.email] ?? "";
   
  }
}
