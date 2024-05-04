import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/widgets/my_button.dart';

// ignore: must_be_immutable
class TestWidgets extends StatelessWidget {
  const TestWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    return Scaffold(body: Center());
  }
}
