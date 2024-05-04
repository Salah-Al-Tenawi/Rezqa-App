import 'package:flutter/material.dart';
import 'package:freelanc/core/constant/imageurl.dart';
class Imagebackground extends StatelessWidget {
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

class ImageFront extends StatelessWidget {
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
