import 'dart:io';

abstract class CompanyprofileRepo {
  saveprofile(
      String namecompany,
      String location,
      String city,
      String email,
      List numberphone,
      String size,
      String type,
      File? imagefront,
      File? imageback,
      List? gallary);
}
