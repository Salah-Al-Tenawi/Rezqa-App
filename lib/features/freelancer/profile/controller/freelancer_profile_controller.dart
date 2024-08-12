import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/functions/check_size_image.dart';
import 'package:freelanc/core/functions/get_token.dart';
import 'package:freelanc/core/functions/show_size_warning.dart';
import 'package:freelanc/core/helper/shared_api_functions.dart';
import 'package:freelanc/core/model/joprole_model.dart';
import 'package:freelanc/core/model/skilles_model.dart';
import 'package:freelanc/core/repository/profiles/freelancer/profile_freelancer_repo.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/features/auth/models/user_model.dart';
import 'package:freelanc/features/freelancer/profile/data/freelancer_model.dart';
import 'package:freelanc/features/freelancer/profile/data/portfolio_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class FreeProfileController extends GetxController {
  removeItemForList(int index, List list);
  goTOeditprofile();
  savePorofile();
  updateProfile();
  addImagefront();
  addImageback();
  selectbirthday(BuildContext context);
  changegender(String selectgender);
  gotoMyprofileforsave();
  gotoAddPortfolio();
  gotoDashBoard();
  showWarningFroJoprole();
  getMYFreelancer();
  getMyProfileFromCach();
  gotoShowMyPortfolio();
  // getAllPortfolio(int id);
  Future<List<SkilleModel>> getListSkilles(String name);
}

class FreeProfileControllerIm extends FreeProfileController {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late ImagePicker imagePicker;
  String username = "";
  late TextEditingController headline;
  late TextEditingController description;

  JoproleModel? joproleModel;
  String joproleName = "";
  List<JoproleModel> joprole = [];

  late TextEditingController city;
  String birthday = "xxxx/xx/xx   ";
  String gender = "male";
  String? profileImageId;
  String? backgroundImageId;
  String? profileImageUrl;
  String? backgroundImageUrl;
  late SharedApiFunctionIm sharedApiFunctionIm;
  late ProfileFreelancerRepoImp profileFreelancerRepoImp;
  MyServices myServices = Get.find();
  List<SkilleModel> skilles = [];

  RxBool isloading = false.obs;
  FreelancerModel? freelnacerModel;
  List<PortfolioModel> portfolios = [];
  @override
  void onInit() async {
    headline = TextEditingController();
    description = TextEditingController();

    city = TextEditingController();
    imagePicker = ImagePicker();
    profileFreelancerRepoImp = Get.put(ProfileFreelancerRepoImp());
    sharedApiFunctionIm = Get.put(SharedApiFunctionIm());
    getMyProfileFromCach();

    super.onInit();
  }

  @override
  Future<List<SkilleModel>> getListSkilles(String name) async {
    final response = await profileFreelancerRepoImp.searchSkilles(name);
    return response;
  }

  @override
  void selectbirthday(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1924),
      lastDate: DateTime(2010),
    );
    if (pickedDate != null) {
      birthday = '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
      update();
    }
  }

  @override
  changegender(String selectgender) {
    gender = selectgender;
    update();
  }

  @override
  goTOeditprofile() async {
    await getMyProfileFromCach();
    // Get.back();
    Get.toNamed(MyRoute.infoprofileFreelancer);
  }

  @override
  addImagefront() async {
    var imagePicked = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      File imagefile = File(imagePicked.path);
      if (await checkSizeFile(imagefile, "image")) {
        var response = await sharedApiFunctionIm.uploadImage(imagefile);
        response.fold((error) => Get.snackbar("error", error), (imagemodel) {
          profileImageUrl = imagemodel.url;
          profileImageId = imagemodel.id.toString();
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
        var response = await sharedApiFunctionIm.uploadImage(imagefile);
        response.fold((error) => Get.snackbar("error", error), (imagemodel) {
          backgroundImageUrl = imagemodel.url;
          backgroundImageId = imagemodel.id.toString();
        });

        update();
      } else {
        showSizeWarning();
      }
    }
  }

  @override
  removeItemForList(int index, List list) {
    list.removeAt(index);
    update();
  }

  @override
  gotoMyprofileforsave() async {
    if (joproleModel != null) {
      Get.toNamed(MyRoute.verfiymyprofileFreelancer);
      UserModel? userModel = await sharedApiFunctionIm.whoIam();
      if (userModel != null) {
        username = userModel.firstname!+userModel.lastname!;
        update();
      } else {
        Get.snackbar("error", "مشكلة في الاتصال بالانترنت");
      }
    } else {
      showWarningFroJoprole();
    }
  }

  @override
  showWarningFroJoprole() {
    Get.defaultDialog(
        backgroundColor: MyColors.blueColor,
        titleStyle: font17greyw600,
        radius: 10,
        title: "قم بإكمال معلوماتك",
        content: Text(
          "اختر تخصصك من قائمة المهارات و الخبرات",
          textAlign: TextAlign.center,
          style: font15whitebold,
        ));
  }

  Future<List<JoproleModel>> searchJoprole(String name) async {
    final response = await profileFreelancerRepoImp.searchJoprole(name);
    return response;
  }

  @override
  gotoAddPortfolio() async {
    Get.toNamed(MyRoute.addportfolio);
  }

  @override
  Future savePorofile() async {
    isloading.value == true;
    UserModel? user = await sharedApiFunctionIm.whoIam();
    if (myServices.sharedpref.getString(KeyShardpref.freelancerJson) != null ||
        user != null && user.role == "freelancer") {
      await updateProfile();
      isloading.value == false;
    } else {
      int? joproleid;
      List<int>? selectskilles;
      if (skilles.isNotEmpty) {
        selectskilles = skilles.map((e) => e.id).toList();
      }
      if (joproleModel != null) {
        joproleid = joproleModel!.id;
      }
      isloading.value == true;
      final response = await profileFreelancerRepoImp.saveFreelancer(
          profileImageId,
          backgroundImageId,
          description.text,
          joproleid ?? 0,
          birthday,
          city.text,
          gender,
          headline.text,
          selectskilles);
      response.fold((error) {
        Get.snackbar("error", error);
        isloading.value = false;
      }, (freelancerModel) async {
        myServices.sharedpref.setInt(KeyShardpref.id, freelancerModel.id);

        String json = jsonEncode(freelancerModel.toJson());
        myServices.sharedpref.setString(KeyShardpref.freelancerJson, json);
        isloading.value = false;

        myServices.sharedpref.setString(KeyShardpref.roleuser, "freelancer");
        Get.snackbar("نجاح", 'تم حفظ بروفايلك');
        isloading.value = false;
        update();
      });
    }
  }

  @override
  updateProfile() async {
    List<int>? selectskilles;
    if (skilles.isNotEmpty) {
      selectskilles = skilles.map((e) => e.id).toList();
    }
    int? joproleid;
    if (joproleModel != null) {
      joproleid = joproleModel!.id;
    }
    isloading.value = true;
    final response = await profileFreelancerRepoImp.updateFreelancer(
        profileImageId,
        backgroundImageId,
        description.text,
        joproleid!,
        birthday,
        city.text,
        gender,
        headline.text,
        selectskilles);
    response.fold((error) {
      Get.snackbar("error", error);
    }, (freelancerModel) async {
      myServices.sharedpref
          .setString(KeyShardpref.roleID, freelancerModel.id as String);

      String json = jsonEncode(freelancerModel.toJson());
      myServices.sharedpref.setString(KeyShardpref.freelancerJson, json);

      final user = await sharedApiFunctionIm.whoIam();
      myServices.sharedpref.setString(KeyShardpref.roleuser, user!.role!);
      isloading.value = false;
    });
  }

  @override
  gotoDashBoard() {
    Get.offAllNamed(MyRoute.dashBoardFreelancer);
  }

  @override
  Future<FreelancerModel?>? getMYFreelancer() async {
    FreelancerModel? free;
    int? id = myServices.sharedpref.getInt(KeyShardpref.id) ?? 0;
    if (id == 0) {
      UserModel? user = await sharedApiFunctionIm.whoIam();
      if (user != null) {
        id = user.roleId ?? 0;
      }
    }

    final response = await profileFreelancerRepoImp.getFreelancer(id);
    response.fold((error) => Get.snackbar("erorr", error), (freelancerModel) {
      free = freelancerModel;
      myServices.sharedpref.setInt(KeyShardpref.id, freelancerModel.id);
      String json = jsonEncode(freelancerModel.toJson());
      myServices.sharedpref.setString(KeyShardpref.freelancerJson, json);
      getMyProfileFromCach();
      return free;
    });
    return null;
  }

  @override
  getMyProfileFromCach() async {
    String? json = myServices.sharedpref.getString(KeyShardpref.freelancerJson);
    // json ?? getMYFreelancer();
    if (json != null) {
      var mapjson = await jsonDecode(json);
      freelnacerModel = FreelancerModel.fromJson(mapjson);

      if (freelnacerModel != null) {
        username = freelnacerModel!.username;
        gender = freelnacerModel!.gender;
        city.text = freelnacerModel!.city;
        skilles = freelnacerModel!.skills ?? [];
        joproleModel = freelnacerModel!.joproleModel;
        profileImageUrl = freelnacerModel!.profileImageUrl;
        backgroundImageUrl = freelnacerModel!.backgroundImageUrl;
        headline.text = freelnacerModel!.headline;
        description.text = freelnacerModel!.description;
        birthday = freelnacerModel!.dateofBirth;
        update();
      }
    }
    // update();
  }

  @override
  gotoShowMyPortfolio() {
    Get.toNamed(MyRoute.showMyportfolio);
  }
}
