// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:freelanc/core/themes/color_app.dart';

// ignore: must_be_immutable
class TextFromWithBottomCaht extends StatelessWidget {
  TextEditingController messagecontroller;
  void Function() onPressed;
   TextFromWithBottomCaht({
    super.key,
    required this.messagecontroller,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messagecontroller,
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
            onPressed: () {
              onPressed();
            },
          ),
        ],
      ),
    );
  }
}
