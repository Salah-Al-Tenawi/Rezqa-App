// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/model/joprole_model.dart';
import 'package:freelanc/core/model/skilles_model.dart';
import 'package:freelanc/features/freelancer/profile/data/portfolio_model.dart';

class FreelancerModel {
  int id;
  String? profileImageUrl;
  String? backgroundImageUrl;
  String username;
  String headline;
  String description;
  String city;
  String dateofBirth;
  JoproleModel joproleModel;
  List<SkilleModel>? skills;
  String gender;
  List<PortfolioModel> potrfolio = [];

  FreelancerModel({
    required this.id,
    required this.profileImageUrl,
    required this.backgroundImageUrl,
    required this.username,
    required this.headline,
    required this.description,
    required this.city,
    required this.dateofBirth,
    required this.joproleModel,
    required this.skills,
    required this.gender,
    required this.potrfolio,
  });

  factory FreelancerModel.fromJson(Map<String, dynamic> json) {
    return FreelancerModel(
        id: json[ApiKey.data][ApiKey.id] ?? 0,
        profileImageUrl: json[ApiKey.data][ApiKey.profileimageUrl] ?? "",
        backgroundImageUrl: json[ApiKey.data][ApiKey.backgroundimageUrl] ?? "",
        username: json[ApiKey.data][ApiKey.username] ?? "",
        headline: json[ApiKey.data][ApiKey.headline] ?? "",
        description: json[ApiKey.data][ApiKey.description] ?? '',
        city: json[ApiKey.data][ApiKey.city] ?? "",
        dateofBirth: json[ApiKey.data][ApiKey.dataOfBirht] ?? "",
        joproleModel:
            JoproleModel.joproleFromJson(json[ApiKey.data][ApiKey.jobRole]),
        skills:
            SkilleModel.listSkillesModel(json[ApiKey.data][ApiKey.skills]) ??
                [],
        gender: json[ApiKey.data][ApiKey.gender] ?? "",
        potrfolio: PortfolioModel.listportfolios(
                json[ApiKey.data][ApiKey.portfolios] ?? []) ??
            []);
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.data: {
        ApiKey.id: id,
        ApiKey.profileimageUrl: profileImageUrl,
        ApiKey.backgroundimageUrl: backgroundImageUrl,
        ApiKey.headline: headline,
        ApiKey.username: username,
        ApiKey.description: description,
        ApiKey.dataOfBirht: dateofBirth,
        ApiKey.gender: gender,
        ApiKey.city: city,
        ApiKey.jobRole: joproleModel.toJson(),
        ApiKey.skills: SkilleModel.skillesToJson(skills),
      }
    };
  }
}
//    "data": {
//         "id": 3,
//         "profile_image_url": null,
//         "background_image_url": null,
//         "username": "salah-12",
//         "headline": "hi there i am using whatsapp",
//         "description": "kdsf jk dsf dfk j fkdkds kjfdf sdkf kfs jklasd fklsd fjlkds flksf ksdf jkjsdk jkd fkdjks lkfsdklf dsklf kldsj fklsdj kldsjk dsklf",
//         "city": "دمشق",
//         "date_of_birth": "2000-01-01",
//         "gender": "male",
//         "job_role_id": {
//             "id": 1,
//             "name": "android developer"
//         },
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
//             },
//             {
//                 "id": 6,
//                 "name": "php",
//                 "required": null
//             }
//         ],
//         "portfolios": [
//             {
//                 "id": 1,
//                 "title": "pfdsads",
//                 "section": "thesection",
//                 "views_count": 0,
//                 "likes_count": 0,
//                 "url": "https://freelancer-l1w8.onrender.com",
//                 "date": null,
//                 "skills": [
//                     {
//                         "id": 1,
//                         "name": "c++",
//                         "required": null
//                     },
//                     {
//                         "id": 2,
//                         "name": "css",
//                         "required": null
//                     },
//                     {
//                         "id": 3,
//                         "name": "dancing",
//                         "required": null
//                     },
//                     {
//                         "id": 4,
//                         "name": "html",
//                         "required": null
//                     },
//                     {
//                         "id": 5,
//                         "name": "laravel",
//                         "required": null
//                     }
//                 ],
//                 "files": [],
//                 "images": [],
//                 "updated_at": "2024-07-26T13:14:07.000000Z",
//                 "created_at": "2024-07-26T13:14:07.000000Z"
//             }
//         ]
//     }
// }
