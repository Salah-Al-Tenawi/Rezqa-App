import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/functions/check_size_image.dart';
import 'package:freelanc/core/functions/go_to_dashboard.dart';
import 'package:freelanc/core/functions/show_size_warning.dart';
import 'package:freelanc/core/helper/shared_api_functions.dart';
import 'package:freelanc/core/repository/profiles/profile_client_repo.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/features/auth/models/user_model.dart';
import 'package:freelanc/features/client/profile/data/client_modle.dart';
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
  getClientFromCash();
  getClient();
}

class ClientProfileControllerIm extends ClientProfileController {
  late ProfileClientRepoIm profileClientRepoIm;
  late SharedApiFunctionIm sharedApiFunctionIm;
  ClientModel? clientModel;
  // late ProfileClientRepoIm profileClientRepoIm;
  String username = "salah";
  // late TextEditingController joptitle;
  late TextEditingController city;
  String birthday = "xxxx/xx/xx   ";
  String gender = "male";
  String? profileImgeUrl;
  String? backgroundImageUrl;
  int? profileImageId;
  int? backgroundImageId;
  late ImagePicker imagePicker;
  late MyServices myServices;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  RxBool isloading = false.obs;

  @override
  void onInit() async {
    // joptitle = TextEditingController();
    sharedApiFunctionIm = Get.put(SharedApiFunctionIm());
    profileClientRepoIm = Get.put(ProfileClientRepoIm());
    city = TextEditingController();
    imagePicker = ImagePicker();
    myServices = Get.find();
    // username = ("${UserRepositry.user!.firstname!}" "${UserRepositry.user!.lastname!}");

    super.onInit();
  }

  @override
  addImagefront() async {
    var imagePicked = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      File imagefile = File(imagePicked.path);
      if (await checkSizeFile(imagefile, "image")) {
        var response = await profileClientRepoIm.uploadImage(imagefile);
        response.fold((error) => Get.snackbar("error", error), (imagemodel) {
          profileImgeUrl = imagemodel.url!;
          print("================================$profileImgeUrl");
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
      if (await checkSizeFile(imagefile, "image")) {
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
  goToeditprofile() async {
    await getClientFromCash();
    Get.toNamed(MyRoute.infoprofileclient);
  }

  @override
  saveprofile() async {
    if (myServices.sharedpref.getString(KeyShardpref.clientJson) == null ||
        myServices.sharedpref.getString(KeyShardpref.roleuser) == null) {
      isloading.value = true;
      final response = await profileClientRepoIm.saveprofile(
          birthday, gender, city.text, profileImageId, backgroundImageId);
      response.fold((error) {
        isloading.value = false;
        Get.snackbar("error", error);
      }, (clientmodel) async {
        print(
            "clientmodel.profileImageUrl====================================$profileImgeUrl");
        String json = jsonEncode(clientmodel.toJson());

        myServices.sharedpref.setString(KeyShardpref.roleuser, "client");
        myServices.sharedpref.setInt(KeyShardpref.id, clientmodel.id!);
        myServices.sharedpref.setString(KeyShardpref.clientJson, json);
        isloading.value = false;
        Get.snackbar("نجاح", "تم حفظ بروفايلك بنجاح");
        gotoDashbord();
      });
    } else {
      await updateProfile();
    }
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
      Get.snackbar("نجاح", "تم تعديل البروفايل");
    });
  }

  @override
  getClientFromCash() async {
   
    String? json = myServices.sharedpref.getString(KeyShardpref.clientJson);
    if (json != null) {
      var mapjson = await jsonDecode(json);
      print("============================================");
      clientModel = ClientModel.fromJson(mapjson);

      if (clientModel == null) {
        await getClient();
      }

      if (clientModel != null) {
        print("================================= client 2");
        username = clientModel!.username!;
        gender = clientModel!.gender!;
        city.text = clientModel!.city!;
        profileImgeUrl = clientModel!.profileImageUrl;
        backgroundImageUrl = clientModel!.backgroundImageUrl;
        birthday = clientModel!.dateOfbirht!;
        update();
      }
    }
  }

  @override
  getClient() async {
    int? id = myServices.sharedpref.getInt(KeyShardpref.id);

    if (id != null) {
      final response = await profileClientRepoIm.getClient(id);
      response.fold((error) => Get.snackbar("erorr", error), (clinetM) {
        clientModel = clinetM;
        myServices.sharedpref.setInt(KeyShardpref.id, clinetM.id!);
        String json = jsonEncode(clinetM.toJson());
        myServices.sharedpref.setString(KeyShardpref.clientJson, json);
      });
    }
  }
}
