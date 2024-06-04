import 'dart:io';

abstract class ProfileClientReop {
  // send id with url parameter (query)
  getClient();
  //need to token
  saveprofile(String birthdat, String gender, String city, String joptitle,
      File imagefront, File imageback);
  updateProfile(String? birthdat, String? gender, String? city,
      String? joptitle, File? imagefront, File? imageback);
  uploadeimageFront(File image);
  uploadeimageBack(File image);
}
