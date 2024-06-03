import 'dart:io';

import 'package:freelanc/core/api/dio_consumer.dart';

abstract class CompanyprofileRepo {
  DioConSumer dio = DioConSumer();
  saveprofile(
      // need token
      String industry,
      String name,
      String streetaddress,
      String description,
      String city,
      String region,
      List contactlinks,
      List numberphone,
      String size,
      File? imagefront,
      File? imageback,
      List? gallary);
  // need token
  deletcompany(String password);
  // need token
  updatecompany(
      String name,
      String description,
      String size,
      String city,
      String region,
      String streetaddress,
      List companyLinks,
      List companyPhones);
  //need token
  updateImgefront(File image);
  updateImgeback(File image);
  // delete request
   deleteImgefront();
  deleteImgeback();
  addImageIngallary(File image);
}

class CompanyprofileRepoIm extends CompanyprofileRepo {
  @override
  saveprofile(
      String industry,
      String name,
      String streetaddress,
      String description,
      String city,
      String region,
      List contactlinks,
      List numberphone,
      String size,
      File? imagefront,
      File? imageback,
      List? gallary) {}

  @override
  deletcompany(String password) {
    // TODO: implement deletcompany
    throw UnimplementedError();
  }
  
  @override
  addImageIngallary(File image) {
    // TODO: implement addImageIngallary
    throw UnimplementedError();
  }
  
  @override
  deleteImgeback() {
    // TODO: implement deleteImgeback
    throw UnimplementedError();
  }
  
  @override
  deleteImgefront() {
    // TODO: implement deleteImgefront
    throw UnimplementedError();
  }
  
  @override
  updateImgeback(File image) {
    // TODO: implement updateImgeback
    throw UnimplementedError();
  }
  
  @override
  updateImgefront(File image) {
    // TODO: implement updateImgefront
    throw UnimplementedError();
  }
  
  @override
  updatecompany(String name, String description, String size, String city, String region, String streetaddress, List companyLinks, List companyPhones) {
    // TODO: implement updatecompany
    throw UnimplementedError();
  }
}
