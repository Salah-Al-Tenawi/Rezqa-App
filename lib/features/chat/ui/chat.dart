// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:freelanc/core/constant/imageurl.dart';
// import 'package:freelanc/core/themes/color_app.dart';
// import 'package:freelanc/core/themes/text_styles_app.dart';

// class Chat extends StatelessWidget {
//   const Chat({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: MyColors.blueColor,
//         actions: [
//           SizedBox(
//             width: 30.w,
//           ),
//           CircleAvatar(
//             backgroundColor: MyColors.greyColor,
//             child: Image.asset(ImagesUrl.imagetest),
//           ),
//           SizedBox(
//             width: 30.w,
//           ),
//           Text(
//             "salah al tenawi",
//             style: font17greynormal,
//           ),
//           const Spacer(),
//         ],
//       ),
//       body: ListView(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/features/chat/controller/chat_controller.dart';
import 'package:get/get.dart';
import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.put(ChatController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.blueColor,
        actions: [
          SizedBox(
            width: 30.w,
          ),
          CircleAvatar(
            backgroundColor: MyColors.greyColor,
            child: Image.asset(ImagesUrl.imagetest),
          ),
          SizedBox(
            width: 30.w,
          ),
          Text(
            "salah al tenawi",
            style: font17greynormal,
          ),
          const Spacer(),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Align(
                        alignment: index % 2 == 0
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Column(
                          // crossAxisAlignment: index % 2 == 0 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          children: [
                            if (controller.messages[index]['reply']!.isNotEmpty)
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                margin: const EdgeInsets.only(bottom: 5.0),
                                child: Text(
                                  controller.messages[index]['reply']!,
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            Container(
                              decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? MyColors.blueColor
                                    : MyColors.greyColor,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                controller.messages[index]['message']!,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
          ),
          Obx(() => controller.replyMessage.value != null
              ? Container(
                  color: Colors.grey[200],
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'الرد على: ${controller.replyMessage.value}',
                          style: TextStyle(
                              color: Colors.black54,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.red),
                        onPressed: () => controller.replyMessage.value = null,
                      ),
                    ],
                  ),
                )
              : SizedBox.shrink()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.messagecontroller,
                    decoration: InputDecoration(
                      hintText: "اكتب رسالة...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: MyColors.blueColor),
                  onPressed: (){ 
                    
                    // controller.sendMessage
                    }
                    ,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
