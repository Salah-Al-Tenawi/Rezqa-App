// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/features/chat/data/paticipants_model.dart';

class ConverSationModel {
  int? id;
  List<ParticipantsModel>? participants;
  ConverSationModel({
    required this.id,
    this.participants,
  });

  factory ConverSationModel.fromJson(Map<String, dynamic> json) {
    return ConverSationModel(
        id: json[ApiKey.conversationId] ?? 0,
        participants: listParticaipants(json));
  }
  static List<ParticipantsModel> listParticaipants(Map<String, dynamic> json) {
    List<ParticipantsModel> participants = [];
    List list = json[ApiKey.participants];
    participants = list.map((e) => ParticipantsModel.fromJson(e)).toList();
    return participants;
  }

//     "data": [
//         {
//             "id": 3,
//             "participant": {
//                 "id": 1,
//                 "name": "client client",
//                 "avatar": null
//             },
//             "last_message": {
//                 "message": "هااااااااااااااي",
//                 "created_at": "2024-08-15T15:27:48+03:00"
//             },
//             "created_at": "2024-08-15T15:20:29+03:00",
//             "updated_at": "2024-08-15T15:20:29+03:00"
//         }
//     ]
// }

  










// {
//     "data": [
//         {
//             "id": 1,
//             "created_at": "2021-01-01T00:00:00.000000Z",
//             "updated_at": "2021-01-01T00:00:00.000000Z"
//         },
  //
//     ]
// }

  // String? name;
  // String? imgeurl;
}

// {
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
