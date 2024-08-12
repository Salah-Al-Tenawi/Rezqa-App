// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freelanc/core/api/api_end_points.dart';
import 'package:freelanc/core/model/image_model.dart';

class CompanyModel {
  int? id;
  String? profileImageUrl;
  String? backgroundImageUrl;
  String? profileImageId;
  String? backgroundImageId;
  String? namecompany;
  String? username;
  String? descreption;
  String? industryname;
  String? size;
  String? city;
  String? region;
  String? streetaddress;
  List<ImageModle>? gallary;
  String? verified;

  CompanyModel({
    this.id,
    this.profileImageUrl,
    this.backgroundImageUrl,
    this.namecompany,
    this.descreption,
    this.industryname,
    this.size,
    this.city,
    this.region,
    this.streetaddress,
    this.backgroundImageId,
    this.profileImageId,
    this.username,
    this.verified,
    this.gallary,
  });

  CompanyModel.fromJson(Map<String, dynamic> json) {
    streetaddress = json[ApiKey.data][ApiKey.streetaddress] ?? "";
    city = json[ApiKey.data][ApiKey.city] ?? "";
    region = json[ApiKey.data][ApiKey.regione] ?? "";
    id = json[ApiKey.data][ApiKey.id] ?? 0;

    profileImageUrl = json[ApiKey.data][ApiKey.profileimageUrl] ?? "";
    backgroundImageUrl = json[ApiKey.data][ApiKey.backgroundimageUrl] ?? "";
    profileImageId = json[ApiKey.data][ApiKey.profileImageID] ?? 0;
    backgroundImageId = json[ApiKey.data][ApiKey.backgroundImageID] ?? 0;
    verified = json[ApiKey.data][ApiKey.verified] ?? "";
    username = json[ApiKey.data][ApiKey.username] ?? "";
    namecompany = json[ApiKey.data][ApiKey.name] ?? "";
    descreption = json[ApiKey.data][ApiKey.description] ?? "";
    size = json[ApiKey.data][ApiKey.size] ?? "";
    industryname = json[ApiKey.data][ApiKey.industryname] ?? "";
    username = json[ApiKey.data][ApiKey.username] ?? "";
    gallary = listgallary(json[ApiKey.data][ApiKey.galleryimages]) ?? [];
  }

  List<ImageModle>? listgallary(List list) {
    List<ImageModle>? imagaes =
        list.map((item) => ImageModle.fromJson(item)).toList();
    return imagaes;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profileImageUrl': profileImageUrl,
      'backgroundImageUrl': backgroundImageUrl,
      'profileImageId': profileImageId,
      'backgroundImageId': backgroundImageId,
      'name': namecompany,
      'username': username,
      'descreption': descreption,
      'industryname': industryname,
      'size': size,
      'city': city,
      'region': region,
      'streetaddress': streetaddress,
      'gallary': gallary?.map((image) => image.toJson()).toList(),
      'verified': verified,
    };
  }

  factory CompanyModel.fromCash(Map<String, dynamic> json) {
    return CompanyModel(
      id: json["id"],
      profileImageUrl: json["profileImageUrl"],
      backgroundImageUrl: json["backgroundImageUrl"],
      profileImageId: json["profileImageId"],
      backgroundImageId: json["backgroundImageId"],
      namecompany: json['name'],
      username: json["username"],
      descreption: json["descreption"],
      industryname: json["industryname"],
      size: json["size"],
      city: json["city"],
      region: json["region"],
      streetaddress: json["streetaddress"],
      gallary: (json["gallary"] as List<dynamic>?)
          ?.map((image) => ImageModle.fromJson(image))
          .toList(),
      verified: json[ApiKey.verified],
    );
  }
}
