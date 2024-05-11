import 'package:flutter/material.dart';
import 'package:freelanc/features/company/dashboard/ui/drawer.dart';

class DashBoardCompany extends StatelessWidget {
  const DashBoardCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCompany(),
      appBar: AppBar(),
      body: Container(),
    );
  }
}
