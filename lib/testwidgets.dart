// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:freelanc/core/services/my_services.dart';
import 'package:get/get.dart';

class TestWidgets extends StatelessWidget {
  const TestWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    TestController controller = TestController();
    return Scaffold(
        body: Center(
      child: IconButton(
          onPressed: () {
            MyServices myServices = Get.find();
            myServices.sharedpref.clear();
          },
          icon: Icon(Icons.abc)),
    ));
    // );
  }
}

class TestController extends GetxController {
  List<dynamic> gallaryid = [2, 3, 4];
  tomap(List<dynamic> list) {
    List done = list.map((item) => {"id": item}).toList();
    print(done);
  }
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
