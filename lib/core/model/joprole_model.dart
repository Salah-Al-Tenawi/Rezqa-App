import 'package:freelanc/core/api/api_end_points.dart';

class JoproleModel {
  String? name;
  int? id;
  // JoproleModel();
  JoproleModel.fromJson(Map<String, dynamic> json) {
    name = json[ApiKey.name] ?? "";
    id = json[ApiKey.id] ?? 0;
  }
  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.name: name,
    };
  }


  static JoproleModel joproleFromJson(Map<String, dynamic> json) {
    return JoproleModel.fromJson(json);
  }
}

class JoproleModelList {
  List<JoproleModel>? data;

  JoproleModelList({this.data});
  JoproleModelList.fromJson(Map<String, dynamic> json) {
    List list = json['data'];
    data = list.map((i) => JoproleModel.fromJson(i)).toList();
  }
}
