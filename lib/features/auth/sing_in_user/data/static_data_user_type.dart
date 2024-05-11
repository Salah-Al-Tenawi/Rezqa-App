import 'package:flutter/material.dart';
import 'package:freelanc/features/auth/sing_in_user/data/static/chose_user_model.dart';

List<ChoseUserModel> listChosetypesuerModel = [
  ChoseUserModel(
      typeuser: "فريلانسر أبحث عن عمل",
      descrtypeuser: " أرغب في التوظيف أو العمل المستقل",
      icon: const Icon(Icons.free_breakfast_outlined)),
  ChoseUserModel(
      typeuser: "شركة أبحث عن موظفين",
      descrtypeuser: "لدي شواغر للعمل عن بعد مع الخبرات المطلوبة",
      icon: const Icon(Icons.home_work_outlined)),
  ChoseUserModel(
      typeuser: "عميل أبحث عن خدمة",
      descrtypeuser: "لدي عمل أريد إنجازه بمقابل و وقت يناسبني",
      icon: const Icon(Icons.work_history_outlined)),
];
