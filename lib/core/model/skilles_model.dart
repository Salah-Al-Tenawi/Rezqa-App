// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freelanc/core/api/api_end_points.dart';

class SkilleModel {
  String name;
  int id;
  SkilleModel({
    required this.name,
    required this.id,
  });

  factory SkilleModel.fromJson(Map<String, dynamic> json) {
    return SkilleModel(name: json[ApiKey.name] ?? "", id: json[ApiKey.id] ?? 0);
  }

  static List<SkilleModel> listSkillesModel(List json) {
    List<SkilleModel> skilles = [];
    skilles = json.map((e) => SkilleModel.fromJson(e)).toList();
    return skilles;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  static List<Map<String, dynamic>>? skillesToJson(List<SkilleModel>? list) {
    List<Map<String, dynamic>>? listskilles;
    if (list != null) {
      listskilles = list.map((e) => e.toJson()).toList();
    }
    return listskilles;
  }
}

class SkilleModelList {
  List<SkilleModel>? data;

  SkilleModelList({this.data});
  SkilleModelList.fromJson(Map<String, dynamic> json) {
    List list = json['data'];
    data = list.map((i) => SkilleModel.fromJson(i)).toList();
  }
}
