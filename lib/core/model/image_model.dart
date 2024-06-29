
class ImageModle {
  int? id;
  String? url;

  ImageModle({this.id, this.url});
  ImageModle.fromJson(Map<String, dynamic> json) {
    id = json['data']['id'] ?? 0;
    url = json['data']['url'] ?? "";
  }

  Map<String, dynamic> toJson() => {
        'url': url,
        'id': id,
      };
}
