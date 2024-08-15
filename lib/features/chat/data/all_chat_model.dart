// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/functions/format_date.dart';
import 'package:freelanc/features/chat/ui/all_chat.dart';


class ChatModel {
  int conversationId;
  int iduser;
  String username;
  String lastMessage;
  String deteLastmessage;
  String profileImage;
  ChatModel({
    required this.conversationId,
    required this.iduser,
    required this.username,
    required this.lastMessage,
    required this.deteLastmessage,
    required this.profileImage,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      conversationId: json[ApiKey.id],
      iduser: json[ApiKey.participant][ApiKey.id]??0,
      username: json[ApiKey.participant][ApiKey.name]??"",
      lastMessage: json[ApiKey.lastMessage][ApiKey.message]??"",
      deteLastmessage:
          getFormattedTime(json[ApiKey.lastMessage][ApiKey.createdAt]),
          profileImage: json[ApiKey.participant][ApiKey.avatar]??""
    );
  }

 static List<ChatModel> listChatModel(Map<String, dynamic> json)  {
    List<ChatModel> listChatModel = [];
    List list = json[ApiKey.data];
    listChatModel = list.map((e) => ChatModel.fromJson(e)).toList();
    return listChatModel;
  }
}

//  "data": [
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
