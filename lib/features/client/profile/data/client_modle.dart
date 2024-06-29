// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freelanc/core/api/api_end_points.dart';

class ClientModel {
  int? id;
  String? username;
  String? gender;
  String? city;
  String? dateOfbirht;
  String? profileImageId;
  String? backgroundImageId;
  String? profileImageUrl;
  String? backgroundImageUrl;

  ClientModel({
    this.id,
    this.username,
    this.gender,
    this.city,
    this.dateOfbirht,
    this.profileImageId,
    this.backgroundImageId,
    this.profileImageUrl,
    this.backgroundImageUrl,
  });

  ClientModel.fromJson(Map<String, dynamic> json) {
    id = json[ApiKey.data][ApiKey.id] ?? 0;
    username = json[ApiKey.data][ApiKey.username] ?? "";
    gender = json[ApiKey.data][ApiKey.gender] ?? "";
    city = json[ApiKey.data][ApiKey.city] ?? "";
    dateOfbirht = json[ApiKey.data][ApiKey.dataOfBirht] ?? "";
    profileImageId = json[ApiKey.data][ApiKey.profileImageID] ?? "";
    backgroundImageId = json[ApiKey.data][ApiKey.backgroundImageID] ?? "";
    profileImageUrl = json[ApiKey.data][ApiKey.profileimageUrl] ?? "";
    backgroundImageUrl = json[ApiKey.data][ApiKey.backgroundimageUrl] ?? "";
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profileImageUrl': profileImageUrl,
      'backgroundImageUrl': backgroundImageUrl,
      'profileImageId': profileImageId,
      'backgroundImageId': backgroundImageId,
      'username': username,
      'city': city,
    };
  }

  factory ClientModel.fromCash(Map<String, dynamic> json) {
    return ClientModel(
      id: json["id"],
      profileImageUrl: json["profileImageUrl"],
      backgroundImageUrl: json["backgroundImageUrl"],
      profileImageId: json["profileImageId"],
      backgroundImageId: json["backgroundImageId"],
      username: json["username"],
      city: json["city"],
    );
  }
}
// {
//     "data": {
//         "id": null,
//         "username": null,
//         "gender": null,
//         "city": null,
//         "date_of_birth": null,
//         "profile_image_id": null,
//         "background_image_id": null,
//         "profile_image_url": null,
//         "background_image_url": null,
//         "created_at": null,
//         "updated_at": null
//     }
// }
 