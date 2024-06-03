import 'package:flutter/material.dart';
import 'package:freelanc/features/client/profile/controller/info_client_profile_controller.dart';
import 'package:freelanc/features/client/profile/ui/widget/custom_form_profile_client.dart';
import 'package:freelanc/features/company/profiles/ui/widget/custom_form_one.dart';
import 'package:freelanc/features/company/profiles/ui/widget/style_profile.dart';
import 'package:get/get.dart';

class InfoProfileClient extends StatelessWidget {
  const InfoProfileClient({super.key});

  @override
  Widget build(BuildContext context) {
    ClientProfileControllerIm controller = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            StyleInfoProfile(
              alignment: Alignment.topRight,
              cricularbottmleft: true,
            ),
            CustomFormProfileClient(controller: controller),
            StyleInfoProfile(
              alignment: Alignment.bottomLeft,
              criculartopright: true,
            ),
          ],
        ),
      ),
    );
  }
}
