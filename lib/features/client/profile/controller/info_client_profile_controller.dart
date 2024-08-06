import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/functions/check_size_image.dart';
import 'package:freelanc/core/functions/show_size_warning.dart';
import 'package:freelanc/core/repository/profiles/profile_client_repo.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class ClientProfileController extends GetxController {
  
  gotoMyprofile();
  selectbirthday(BuildContext context);
  changegender(String selectgender);
  saveprofile();
  goToeditprofile();
  updateProfile();
  addImagefront();
  addImageback();
}

class ClientProfileControllerIm extends ClientProfileController {
  late ProfileClientRepoIm profileClientRepoIm;
  String username = "salah";
  late TextEditingController joptitle;
  late TextEditingController city;
  String birthday = "xxxx/xx/xx   ";
  String gender = "male";
  String? profileImgeUrl;
  String? backgroundImageUrl;
  int? profileImageId;
  int? backgroundImageId;
  late ImagePicker imagePicker;
  late MyServices myServices;
  late GlobalKey<FormState> formkey;
  RxBool isloading = false.obs;

  @override
  void onInit() {
    profileClientRepoIm = Get.put(ProfileClientRepoIm());
    joptitle = TextEditingController();
    city = TextEditingController();
    imagePicker = ImagePicker();
    formkey = GlobalKey<FormState>();
    myServices = Get.find();
    // username = ("${UserRepositry.user!.firstname!}" "${UserRepositry.user!.lastname!}");
    super.onInit();
  }

  @override
  addImagefront() async {
    var imagePicked = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      File imagefile = File(imagePicked.path);
      if (await checkSizeFile(imagefile,"image")) {
        var response = await profileClientRepoIm.uploadImage(imagefile);
        response.fold((error) => Get.snackbar("error", error), (imagemodel) {
          profileImgeUrl = imagemodel.url!;
          profileImageId = imagemodel.id;
        });

        update();
      } else {
        showSizeWarning();
      }
    }
  }

  @override
  addImageback() async {
    var imagePicked = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      File imagefile = File(imagePicked.path);
      if (await checkSizeFile(imagefile,"image")) {
        var response = await profileClientRepoIm.uploadImage(imagefile);
        response.fold((error) => Get.snackbar("error", error), (imagemodel) {
          backgroundImageUrl = imagemodel.url;
          backgroundImageId = imagemodel.id;
        });

        update();
      } else {
        showSizeWarning();
      }
    }
  }

  @override
  void selectbirthday(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      // initialDate: DateTime.now(),
      firstDate: DateTime(1924),
      lastDate: DateTime(2010),
    );
    if (pickedDate != null) {
      birthday = '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
      update();
    }
  }

  @override
  gotoMyprofile() {
    if (formkey.currentState!.validate()) {
      Get.toNamed(MyRoute.myprofileclient);
    }
  }

  @override
  goToeditprofile() {
    Get.toNamed(MyRoute.infoprofileclient);
  }

  @override
  saveprofile() async {
    isloading.value = true;
    final response = await profileClientRepoIm.saveprofile(
        birthday, gender, city.text, profileImageId, backgroundImageId);
    response.fold((error) {
      isloading.value = false;
      Get.snackbar("error", error);
    }, (clientmodel) {
      String json = jsonEncode(clientmodel.toJson());
      myServices.sharedpref.setString(KeyShardpref.clientJson, json);
      isloading.value = false;
    });
  }

  @override
  changegender(String selectgender) {
    gender = selectgender;
    update();
  }

  @override
  updateProfile() async {
    isloading.value = true;
    final response = await profileClientRepoIm.updateProfile(
        birthday, gender, city.text, profileImageId, backgroundImageId);
    response.fold((erroe) {
      Get.snackbar("error", erroe);
      isloading.value = false;
    }, (clientmodel) {
      String json = jsonEncode(clientmodel.toJson());
      myServices.sharedpref.setString(KeyShardpref.clientJson, json);
      isloading.value = false;
    });
  }
  
  
}
