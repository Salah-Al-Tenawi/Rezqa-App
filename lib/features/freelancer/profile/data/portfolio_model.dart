// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/model/file_model.dart';
import 'package:freelanc/core/model/image_model.dart';
import 'package:freelanc/core/model/skilles_model.dart';

class PortfolioModel {
  int id;
  String title;
  String url;
  String date;
  String description;
  List<FileModel> files;
  List<ImageModle> images=[];
  List<SkilleModel> skills=[];
  String likesCount;
  String section;
  String viewsCount;
  String createdAt;
  String updatedAt;

  PortfolioModel({
    required this.id,
    required this.title,
    required this.url,
    required this.date,
    required this.description,
    required this.files,
    required this.images,
    required this.skills,
    required this.likesCount,
    required this.section,
    required this.viewsCount,
    required this.createdAt,
    required this.updatedAt,
  });


  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    final data = json[ApiKey.data] ?? json;
    return PortfolioModel(
        id: data[ApiKey.id] ?? 0,
        title: data[ApiKey.title] ?? "",
        url: data[ApiKey.url] ?? "",
        date: data[ApiKey.data] ?? "",
        description:data[ApiKey.description] ?? "",
        files:FileModel.listFilesFromJson(data[ApiKey.fileIds])??[],
        images: ImageModle.listImageModel(data[ApiKey.imageIds])??[],
        skills: SkilleModel.listSkillesModel(data[ApiKey.skillsId])??[],
        section: data[ApiKey.section] ?? "",
        createdAt: data[ApiKey.createdAt] ?? "",
        likesCount: data[ApiKey.likesCount] ?? "",
        updatedAt: data[ApiKey.updatedAt] ?? "",
        viewsCount:data[ApiKey.viewsCount] ?? "");
  }


  static List<PortfolioModel> ?listportfolios(List list) {
    List<PortfolioModel> listSkilles =
        list.map((e) => PortfolioModel.fromJson(e)).toList();
    return listSkilles;
  }
}
//  "data": {
//         "id": 1,
//         "title": "pfdsads",
//         "section": "thesection",
//         "views_count": null,
//         "likes_count": null,
//         "url": "https://freelancer-l1w8.onrender.com",
//         "date": null,
//         "skills": [
//             {
//                 "id": 1,
//                 "name": "c++",
//                 "required": null
//             },
//             {
//                 "id": 2,
//                 "name": "css",
//                 "required": null
//             },
//             {
//                 "id": 3,
//                 "name": "dancing",
//                 "required": null
//             },
//             {
//                 "id": 4,
//                 "name": "html",
//                 "required": null
//             },
//             {
//                 "id": 5,
//                 "name": "laravel",
//                 "required": null
//             }
//         ],
//         "files": [],
//         "images": [],
//         "updated_at": "2024-07-26T13:14:07.000000Z",
//         "created_at": "2024-07-26T13:14:07.000000Z"
//     }
// }