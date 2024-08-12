import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/features/dashboard/controller/drawer_and_appbar_board_controller.dart';
import 'package:freelanc/features/dashboard/ui/widget/appBar_dashboard.dart';
import 'package:freelanc/features/dashboard/ui/widget/my_drawer.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DashBoard extends StatelessWidget {
  MyDrawerAndAppbarControllerIm controller =
      Get.put(MyDrawerAndAppbarControllerIm());

  DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: MyDrawer(
          controller: controller,
        ),
      ),
      appBar: AppBarDashboard(controller: controller),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        activeColor: MyColors.greyColor,
        backgroundColor: MyColors.blueColor,
        initialActiveIndex: controller.selectedPage.value,
        items: const [
          TabItem(icon: Icons.free_breakfast, title: 'مستقلين'),
          TabItem(icon: Icons.home_work, title: 'شركات'),
          TabItem(icon: Icons.person, title: 'عملاء'),
        ],
        onTap: (int index) {
          controller.jumpToPage(index);
        },
      ),
      body: Obx(() => IndexedStack(
            index: controller.selectedPage.value,
            children: const [
              Center(child: Text('صفحة مستقلين')),
              Center(child: Text('صفحة شركات')),
              Center(child: Text('صفحة عملاء')),
            ],
          )),
    );
  }
}
