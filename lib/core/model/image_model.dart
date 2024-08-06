import 'package:freelanc/core/api/api_end_points.dart';

class ImageModle {
  int? id;
  String? url;

  ImageModle({this.id, this.url});
  factory ImageModle.fromJson(Map<String, dynamic> json) {
    final data = json[ApiKey.data] ?? json;
    return ImageModle(
      
        id: data['id'] ?? 0, url: data['url'] ?? "");
  }

  Map<String, dynamic> toJson() => {
        'url': url,
        'id': id,
      };

  static List<ImageModle> ?listImageModel(List json) {
    List<ImageModle> images = json.map((e) => ImageModle.fromJson(e)).toList();
    return images;
  }
}
