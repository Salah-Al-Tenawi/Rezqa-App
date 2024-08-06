// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// abstract class ChatController extends GetxController{

// }
// class ChatControllerIm extends ChatController{
//   var messages = <String>[].obs;
//   final TextEditingController messageController = TextEditingController();

//   void sendMessage() {
//     if (messageController.text.isNotEmpty) {
//       messages.add(messageController.text);
//       messageController.clear();
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatController extends GetxController {
  var messages = <Map<String, String>>[]
      .obs; // Updated to hold maps with messages and replies
  final TextEditingController messagecontroller = TextEditingController();
  var replyMessage = RxnString(); // Observable for the reply message

  @override
  void onInit() async {
    print("==============================================");
    await initSocket();
    print("==============================================");
    super.onInit();
  }

  
//   sendMessage() {
//   String message = messagecontroller.text.trim();
//   if (message.isEmpty) return;
//   Map messageMap = {
//     'message': message,
//     'senderId': userId,
//     'receiverId': receiverId,
//     'time': DateTime.now().millisecondsSinceEpoch,
//   };
//   socket.emit('sendNewMessage', messageMap);
// }

  initSocket() {
    var socket = IO.io("APIConstants.socketServerURL", <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((_) {
      print('Connection established');
    });
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));
  }
}

// import 'package:flutter/material.dart';

// import 'package:socket_io_client/socket_io_client.dart' as IO;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ChatScreen(),
//     );
//   }
// }

// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   IO.Socket socket;
//   List<String> messages = [];
//   TextEditingController controller = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     initSocket();
//   }

//   void initSocket() {
//     socket = IO.io('http://localhost:3000', <String, dynamic>{
//       'transports': ['websocket'],
//     });
//     socket.connect();

//     socket.on('connect', (_) {
//       print('Connected to server');
//     });

//     socket.on('message', (data) {
//       setState(() {
//         messages.add(data);
//       });
//     });

//     socket.on('disconnect', (_) {
//       print('Disconnected from server');
//     });
//   }

//   void sendMessage(String message) {
//     socket.emit('message', message);
//     setState(() {
//       messages.add(message);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Chat App')),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(messages[index]),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: controller,
//                     decoration: InputDecoration(
//                       hintText: 'Enter message...',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     sendMessage(controller.text);
//                     controller.clear();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     socket.dispose();
//     super.dispose();
//   }
// }

// import 'package:get/get.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class ChatController extends GetxController {
//   IO.Socket socket;
//   var messages = <String>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     initSocket();
//   }

//   void initSocket() {
//     socket = IO.io('http://localhost:3000', <String, dynamic>{
//       'transports': ['websocket'],
//     });
//     socket.connect();

//     socket.on('connect', (_) {
//       print('Connected to server');
//     });

//     socket.on('message', (data) {
//       messages.add(data);
//     });

//     socket.on('disconnect', (_) {
//       print('Disconnected from server');
//     });
//   }

//   void sendMessage(String message) {
//     socket.emit('message', message);
//     messages.add(message);
//   }

//   @override
//   void onClose() {
//     socket.dispose();
//     super.onClose();
//   }
// }
/////////////////
///ui
///import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'chat_controller.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       home: ChatScreen(),
//     );
//   }
// }

// class ChatScreen extends StatelessWidget {
//   final ChatController chatController = Get.put(ChatController());
//   final TextEditingController textEditingController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Chat App')),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(() {
//               return ListView.builder(
//                 itemCount: chatController.messages.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(chatController.messages[index]),
//                   );
//                 },
//               );
//             }),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: textEditingController,
//                     decoration: InputDecoration(
//                       hintText: 'Enter message...',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     chatController.sendMessage(textEditingController.text);
//                     textEditingController.clear();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
