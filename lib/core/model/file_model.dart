// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freelanc/core/api/api_end_points.dart';

class FileModel {
  int? id;
  String? url;
  int? size;
  String? extention;
  FileModel({
    required this.id,
    required this.url,
    required this.size,
    required this.extention,
  });

  factory FileModel.formJson(Map<String, dynamic> json) {
    final data = json[ApiKey.data] ?? json;
    return FileModel(
        id: data[ApiKey.id] ?? 0,
        url: data[ApiKey.url] ?? "",
        size: data[ApiKey.size] ?? 0,
        extention: data[ApiKey.extention] ?? "");
  }

 static List<FileModel> listFilesFromJson(List list) {
    List<FileModel> listfiles=[];
    listfiles = list.map((e) => FileModel.formJson(e)).toList();
    return listfiles;
  }
}
