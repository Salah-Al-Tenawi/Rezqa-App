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
import 'package:freelanc/features/chat/ui/widget/text_form_wiht_button_chat.dart';
import 'package:get/get.dart';
import 'package:freelanc/core/constant/imageurl.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatControllerIm controller = Get.put(ChatControllerIm());

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
                        alignment: Alignment.centerRight,
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
          TextFromWithBottomCaht(
            messagecontroller: controller.messagecontroller,
            onPressed: () {
              if (controller.messagecontroller.text.isNotEmpty) {
                controller.messages.add(controller.messagecontroller.text);
              }
            },
          )
        ],
      ),
    );
  }
}
