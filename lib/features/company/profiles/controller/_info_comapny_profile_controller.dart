import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/functions/check_size_image.dart';
import 'package:freelanc/core/functions/show_size_warning.dart';
import 'package:freelanc/core/helper/shared_api_functions.dart';
import 'package:freelanc/core/repository/profiles/profile_company_repo.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/features/auth/models/user_model.dart';
import 'package:freelanc/features/company/profiles/data/company_model.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

abstract class InfoCompanyProfileController extends GetxController {
  getcompany();
  goprofile();
  saveprofile();
  updateProfile();
  goToeditprofile();
  addgallary();
  changType(String type);
  changSize(String size);
  addImagefront();
  addImageback();
  removeImageFromGallary(int index);
  getallIndutry(String? name);
  getCompanyfromCashAndShowIT();
  showFullImage(String imageUrl);
}

class CompanyProfileControllerIm extends InfoCompanyProfileController {
  int? id;
  late GlobalKey<FormState> keyform = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController streetaddress;
  late TextEditingController region;
  late TextEditingController descrption;
  RxList allindustry = [].obs;
  late List size;
  String? selectindustry;
  String? selectsize;
  late ImagePicker imagePicker;
  String? imagefrontUrl;
  String? imagebackUrl;
  String? imagefrontId;
  String? imagebackId;
  List<int> gallaryids = [];
  List<String> gallaryUrl = [];
  late MyServices myServices;
  late CompanyprofileRepoIm companyprofileRepoIm;
  CompanyModel? companyMapFromCash;
  SharedApiFunctionIm sharedApiFunctionIm = Get.put(SharedApiFunctionIm());
  RxBool isloading = false.obs;
// the logic

  @override
  void onInit() async {
    companyprofileRepoIm = Get.put(CompanyprofileRepoIm());
    myServices = Get.find();
    // myServices.sharedpref.clear();

    streetaddress = TextEditingController();
    city = TextEditingController();
    name = TextEditingController();
    region = TextEditingController();
    descrption = TextEditingController();
    imagePicker = ImagePicker();
    getCompanyfromCashAndShowIT();
    size = [
      "أقل من 10 موظفين",
      "10 - 50 موظف",
      "50 - 100 موظف",
      "أكثر من 100 موظف"
    ];
    selectsize = "أقل من 10 موظفين";
    selectindustry = "";
    await getallIndutry("");

    super.onInit();
  }

  @override
  goprofile() {
    if (keyform.currentState!.validate()) {
      Get.toNamed(MyRoute.verfiymyprofilecompany);
    }
  }

  @override
  changType(String type) {
    selectindustry = type;
  }

  @override
  changSize(String size) {
    selectsize = size;
  }

  @override
  addgallary() async {
    var imagePicked = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      final File imagefile = File(imagePicked.path);
      if (await checkSizeFile(imagefile, "image")) {
        final response = await companyprofileRepoIm.uploadImage(imagefile);
        response.fold((error) => Get.snackbar("error", error), (imagemodel) {
          gallaryUrl.add(imagemodel.url!);
          gallaryids.add(imagemodel.id!);
        });

        update();
      } else {
        showSizeWarning();
      }
    }
  }

  @override
  goToeditprofile() {
    Get.toNamed(MyRoute.infoprofilecompany);
  }

  @override
  saveprofile() async {
    if (myServices.sharedpref.getString(KeyShardpref.companyJson) == null) {
      isloading.value = true;
      final response = await companyprofileRepoIm.saveprofile(
          imagefrontId,
          imagebackId,
          name.text,
          descrption.text,
          selectindustry!,
          streetaddress.text,
          city.text,
          region.text,
          selectsize!,
          gallaryids);
      response.fold(
          (error) => {Get.snackbar("error", error), isloading.value = false},
          (companyModel) async {
        String json = jsonEncode(companyModel.toJson());
        myServices.sharedpref.setString(KeyShardpref.companyJson, json);
        UserModel? user = await sharedApiFunctionIm.whoIam();
        myServices.sharedpref.setString(KeyShardpref.roleuser, user!.role!);
        myServices.sharedpref.setString(KeyShardpref.id, user.id! as String);
        isloading.value = false;
        Get.offAllNamed(MyRoute.dashbord);
      });
    } else {
      updateProfile();
    }
  }

  @override
  updateProfile() async {
    isloading.value = true;
    final response = await companyprofileRepoIm.updatecompany(
        imagefrontId,
        imagebackId,
        name.text,
        descrption.text,
        streetaddress.text,
        city.text,
        region.text,
        selectsize!,
        gallaryids);

    response.fold((error) {
      Get.snackbar("error", error);
      isloading.value = false;
    }, (companyModel) {
      String json = jsonEncode(companyModel.toJson());
      myServices.sharedpref.setString(KeyShardpref.companyJson, json);
      isloading.value = false;
    });
  }

  @override
  addImageback() async {
    var imagePicked = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      File imagefile = File(imagePicked.path);
      if (await checkSizeFile(imagefile, "file")) {
        var response = await companyprofileRepoIm.uploadImage(imagefile);
        response.fold((error) => Get.snackbar("error", error), (imagemodel) {
          imagebackUrl = imagemodel.url;
          imagebackId = imagemodel.id.toString();
        });

        update();
      } else {
        showSizeWarning();
      }
    }
  }

  @override
  addImagefront() async {
    var imagePicked = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      File imagefile = File(imagePicked.path);
      if (await checkSizeFile(imagefile, "image")) {
        var response = await companyprofileRepoIm.uploadImage(imagefile);
        response.fold((error) => Get.snackbar("error", error), (imagemodel) {
          imagefrontUrl = imagemodel.url!;
          imagefrontId = imagemodel.id.toString();
        });
        // print(imagefront);
        update();
      } else {
        showSizeWarning();
      }
    }
  }

  @override
  removeImageFromGallary(int index) {
    gallaryUrl.removeAt(index);
    gallaryids.removeAt(index);

    update();
  }

  @override
  getallIndutry(String? name) async {
    final response = await companyprofileRepoIm.getallindustry(name);
    response.fold((error) => Get.snackbar("خطأ", error),
        (allindutry) => allindustry.value = allindutry);
  }

  @override
  getCompanyfromCashAndShowIT() async {
    String? json = myServices.sharedpref.getString(KeyShardpref.companyJson);
    if (json != null) {
      var mapjson = await jsonDecode(json);
      companyMapFromCash = CompanyModel.fromCash(mapjson);
      if (companyMapFromCash == null) {
        await getcompany();
        companyMapFromCash = CompanyModel.fromCash(mapjson);
      }

      if (companyMapFromCash != null) {
        id = companyMapFromCash!.id!;
        name.text = companyMapFromCash!.namecompany!;
        imagebackUrl = companyMapFromCash!.backgroundImageUrl!;
        imagefrontUrl = companyMapFromCash!.profileImageUrl!;
        descrption.text = companyMapFromCash!.descreption!;
        city.text = companyMapFromCash!.city!;
        streetaddress.text = companyMapFromCash!.streetaddress!;
        region.text = companyMapFromCash!.region!;
        selectindustry = companyMapFromCash!.industryname!;

        selectsize = companyMapFromCash!.size!;
        update();
      }
    }
  }

  @override
  getcompany() async {
    int? id = myServices.sharedpref.getInt(KeyShardpref.roleID);
    if (id == null) {
      UserModel? user;
      user = await sharedApiFunctionIm.whoIam();
      id = user!.roleId;
    }
    if (id != null) {
      final response = await companyprofileRepoIm.showcompany(id);
      response.fold((error) => Get.snackbar("error", error), (companyModel) {
        String json = jsonEncode(companyModel.toJson());
        myServices.sharedpref.setString(KeyShardpref.companyJson, json);
        update();
      });
    }
  }

  @override
  void showFullImage(String imageUrl) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
