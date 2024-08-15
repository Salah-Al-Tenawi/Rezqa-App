// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:freelanc/features/chat/controller/chat_controller.dart';

// ignore: must_be_immutable
class ChatBody extends StatelessWidget {
  ChatControllerIm controller;
   ChatBody({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ListView.builder(
          controller: controller.scrollController,
          itemCount: controller.messages.length,
          itemBuilder: (context, index) {
            controller.messages[index].userid == controller.myid
                ? controller.isSender = true
                : controller.isSender = false;

            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Align(
                alignment: controller.isSender == true
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: controller.isSender == true
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: controller.isSender == true
                            ? MyColors.blueColor
                            : MyColors.greyTextColor,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(12.0),
                          topRight: const Radius.circular(12.0),
                          bottomLeft: controller.isSender!
                              ? const Radius.circular(12.0)
                              : Radius.zero,
                          bottomRight: controller.isSender!
                              ? Radius.zero
                              : const Radius.circular(12.0),
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            controller.messages[index].message!,
                            style: const TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            controller.messages[index].create!,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
