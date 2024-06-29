// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:freelanc/core/constant/imageurl.dart';

// ignore: must_be_immutable
class ImageCover extends StatelessWidget {
  String urlImage;

   ImageCover({
    super.key,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Detail')),
      body: Center(
        child: Hero(
          tag: 'profileImage',
          child: Image.network(
           urlImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ImageFront extends StatelessWidget {
  const ImageFront({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Detail')),
      body: Center(
        child: Hero(
          tag: 'profileImage',
          child: Image.asset(
            ImagesUrl.imagetest, // احلي صورة هنا
            fit: BoxFit.cover, // تحجيم الصورة لتناسب الشاشة
          ),
        ),
      ),
    );
  }
}
