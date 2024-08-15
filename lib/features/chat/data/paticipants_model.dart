// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freelanc/core/api/api_end_points.dart';

class ParticipantsModel {
  int userId;
  String? username;
  String firstname;
  String lastname;
  String? profileImageUrl;
  bool online;
  ParticipantsModel({
    required this.userId,
    required this.firstname,
    required this.lastname,
    required this.online,
    this.username,
    this.profileImageUrl,
  });
  factory ParticipantsModel.fromJson(Map<String, dynamic> json) {
    String firstname = json[ApiKey.firstname] ?? '';
    String lastname = json[ApiKey.lastname] ?? '';
    return ParticipantsModel(
        userId: json[ApiKey.id] ?? 0,
        firstname: json[ApiKey.firstname] ?? '',
        lastname: json[ApiKey.lastname] ?? '',
        online: json[ApiKey.online] ?? false,
        username: '$firstname $lastname',
        profileImageUrl: json[ApiKey.image]);
  }
}





  
// "message": "Conversation created successfully",
// "conversation_id": 2,
// "participants": [
//     {
//         "id": 1,
//         "money": 10000,
//         "fcm_token": null,
//         "role_id": 1,
//         "role_type": "App\\Models\\Client",
//         "provider": null,
//         "first_name": "client",
//         "last_name": "client",
//         "email": "client@gmail.com",
//         "email_verified_at": "2000-11-10T22:00:00.000000Z",
//         "email_otp_code": null,
//         "email_otp_expired_date": null,
//         "password_otp_code": null,
//         "password_otp_expired_date": null,
//         "last_seen": "2024-08-13T15:38:16.000000Z",
//         "created_at": "2024-08-13T15:25:09.000000Z",
//         "updated_at": "2024-08-13T15:38:16.000000Z",
//         "online": true,
//         "pivot": {
//             "conversation_id": 2,
//             "user_id": 1
//         }
//     },
//     {
//         "id": 9,
//         "money": 10000,
//         "fcm_token": null,
//         "role_id": 1,
//         "role_type": "App\\Models\\Freelancer",
//         "provider": null,
//         "first_name": "freelancer1",
//         "last_name": null,
//         "email": "freelancer1@gmail.com",
//         "email_verified_at": "2024-08-13T15:25:19.000000Z",
//         "email_otp_code": null,
//         "email_otp_expired_date": null,
//         "password_otp_code": null,
//         "password_otp_expired_date": null,
//         "last_seen": "2024-08-13T15:38:40.000000Z",
//         "created_at": "2024-08-13T15:25:21.000000Z",
//         "updated_at": "2024-08-13T15:38:40.000000Z",
//         "online": true,
//         "pivot": {
//             "conversation_id": 2,
//             "user_id": 9
//         }
//     }
// ]
// }
