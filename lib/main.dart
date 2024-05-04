import 'package:flutter/material.dart';
import 'package:freelanc/my_app.dart';
import 'package:freelanc/core/services/my_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalservices();
  runApp(const MyApp());
}
