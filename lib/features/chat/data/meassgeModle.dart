// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/functions/format_date.dart';
import 'package:intl/intl.dart';

class MessageModel {
  int? id;
  String? message;
  String? create;
  String? imageUrl;
  int? userid;

  MessageModel({
    this.id,
    this.message,
    this.create,
    this.imageUrl,
    this.userid,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json[ApiKey.id] ?? 0,
      message: json[ApiKey.message] ?? "",
      create: getFormattedTime(json[ApiKey.createdAt]) ?? "",
      imageUrl: json[ApiKey.image] ?? "",
      userid: json[ApiKey.userId] ?? 0,
    );
  }

  static List<MessageModel> messages(Map<String, dynamic> json) {
    List<MessageModel> messages = [];
    List list = json[ApiKey.data];
    messages = list.map((e) => MessageModel.fromJson(e)).toList();

    return messages;
  }

  
}

// import 'dart:convert';

// // Step 1: Define the MessageModel class
// class MessageModel {
//   final int id;
//   final int conversationId;
//   final int userId;
//   final String message;
//   final String? image;
//   final int? parentId;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final List<MessageModel> replies;
//   final MessageModel? parent;

//   MessageModel({
//     required this.id,
//     required this.conversationId,
//     required this.userId,
//     required this.message,
//     this.image,
//     this.parentId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.replies,
//     this.parent,
//   });

//   // Step 2: Create a factory constructor to parse JSON
//   factory MessageModel.fromJson(Map<String, dynamic> json) {
//     return MessageModel(
//       id: json['id'],
//       conversationId: json['conversation_id'],
//       userId: json['user_id'],
//       message: json['message'],
//       image: json['image'],
//       parentId: json['parent_id'],
//       createdAt: DateTime.parse(json['created_at']),
//       updatedAt: DateTime.parse(json['updated_at']),
//       replies: (json['replies'] as List)
//           .map((reply) => MessageModel.fromJson(reply))
//           .toList(),
//       parent: json['parent'] != null
//           ? MessageModel.fromJson(json['parent'])
//           : null,
//     );
//   }
// }

// // Step 3: Function to parse JSON and return a List<MessageModel>
// List<MessageModel> parseMessages(Map<String, dynamic> json) {
//   return (json['data'] as List)
//       .map((messageJson) => MessageModel.fromJson(messageJson))
//       .toList();
// }

// void main() {
//   // Example JSON
//   final jsonString = '''
//   {
//     "current_page": 1,
//     "data": [
//         {
//             "id": 1,
//             "conversation_id": 2,
//             "user_id": 1,
//             "message": "معك محسن من الدرعية",
//             "image": null,
//             "parent_id": null,
//             "created_at": "2024-08-13T20:18:37.000000Z",
//             "updated_at": "2024-08-13T20:18:37.000000Z",
//             "replies": [],
//             "parent": null
//         },
//         {
//             "id": 4,
//             "conversation_id": 2,
//             "user_id": 1,
//             "message": "شو خيو",
//             "image": null,
//             "parent_id": null,
//             "created_at": "2024-08-13T20:39:12.000000Z",
//             "updated_at": "2024-08-13T20:39:12.000000Z",
//             "replies": [],
//             "parent": null
//         }
//     ]
//   }
//   ''';

//   final Map<String, dynamic> jsonData = jsonDecode(jsonString);
//   final List<MessageModel> messages = parseMessages(jsonData);

//   // Use the messages list
//   for (var message in messages) {
//     print('Message ID: ${message.id}, Content: ${message.message}');
//   }
// }



 


// "data": [
//         {
//             "id": 1,
//             "conversation_id": 2,
//             "user_id": 1,
//             "message": "معك محسن من الدرعية",
//             "image": null,
//             "parent_id": null,
//             "created_at": "2024-08-13T20:18:37.000000Z",
//             "updated_at": "2024-08-13T20:18:37.000000Z",
//             "replies": [],
//             "parent": null
//         }
//     ],