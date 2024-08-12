// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:freelanc/core/widgets/custom_dropdown.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_profile_controller.dart';
import 'package:freelanc/features/profiles/controller/any_profile_controlelr.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class TestWidgets extends StatelessWidget {
  const TestWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    TestController controller = TestController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi-Select Dropdown with GetX'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            IconButton(
                onPressed: () async {
                  controller.controller.getfreelancer(3);
                },
                icon: Icon(Icons.abc))
          ],
        ),
      ),
    );
  }
}

class TestController extends GetxController {
  AnyProfileControllerIm controller = Get.put(AnyProfileControllerIm());

  // void addItem(String item) {
  //   if (!selectedItems.contains(item)) {
  //     selectedItems.add(item);
  //   }
}

  



// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: ListView(
//           children: [
// Load a Lottie file from your assets
//             Lottie.asset('assets/LottieLogo1.json'),

// Load a Lottie file from a remote url
//             Lottie.network(
//                 'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),

// Load an animation and its images from a zip file
//             Lottie.asset('assets/lottiefiles/angel.zip'),
//           ],
//         ),
//       ),
//     );
//   }
// }
