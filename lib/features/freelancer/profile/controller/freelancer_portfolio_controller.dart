import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:freelanc/core/constant/key_shared.dart';
import 'package:freelanc/core/functions/check_size_image.dart';
import 'package:freelanc/core/functions/show_dialog.dart';
import 'package:freelanc/core/functions/show_size_warning.dart';
import 'package:freelanc/core/helper/shared_api_functions.dart';
import 'package:freelanc/core/model/file_model.dart';
import 'package:freelanc/core/model/image_model.dart';
import 'package:freelanc/core/model/skilles_model.dart';
import 'package:freelanc/core/repository/profiles/freelancer/profile_freelancer_repo.dart';
import 'package:freelanc/core/repository/profiles/freelancer/protfolio_freelancer_repo.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/services/my_services.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/auth/models/user_model.dart';
import 'package:freelanc/features/freelancer/profile/data/portfolio_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class FreelancerPortfolioController extends GetxController {
  ImagePicker imagePicker = ImagePicker();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController section = TextEditingController();

  String date = "xxxx/xx/xx   ";
  TextEditingController url = TextEditingController();
  TextEditingController description = TextEditingController();
  List<int> fileIds = [];
  List<ImageModle> images = [];
  List<SkilleModel> skilles = [];
  late SharedApiFunctionIm sharedApiFunctionIm;
  late MyServices myServices;
  RxBool isloading = false.obs;
  bool loadingFile = false;
  bool loadingImage = false;
  List<FileModel> filemodel = [];
  List<PortfolioModel> portfolios = [];

  // functions
  savePortfoilo();
  editPortfolio();
  deletProtfolio();
  gotoMyProfile();
  selectDate(BuildContext context);

  uploadFile();

  removeItemForLIst(List list, int index);
  getPortfolio(int id);

  addImage();
  getListSkilles(String name);
  Future<List<PortfolioModel>> getAllPortfolio();
}

class FreelancerPortfolioControllerIm extends FreelancerPortfolioController {
  PortfolioFreelancerRepoIm portfolioFreelancerRepoIm =
      Get.put(PortfolioFreelancerRepoIm());

  ProfileFreelancerRepoImp profileFreelancerRepoImp =
      Get.put(ProfileFreelancerRepoImp());
  @override
  void onInit() {
    myServices = Get.find();
    sharedApiFunctionIm = Get.put(SharedApiFunctionIm());

    super.onInit();
  }

  @override
  Future<List<PortfolioModel>> getAllPortfolio() async {
    int? id = myServices.sharedpref.getInt(KeyShardpref.roleID);
    // UserModel? user;
    // if (id == null) {
    //   user = await sharedApiFunctionIm.whoIam();
    //   id = user!.roleId;
    // }
    final response = await profileFreelancerRepoImp.getFreelancer(id!);
    response.fold((l) => Get.snackbar("error", l), (freelancerMoel) {
      portfolios = freelancerMoel.potrfolio;
    });
    return portfolios;
  }

  @override
  Future<List<SkilleModel>> getListSkilles(String name) async {
    final response = await profileFreelancerRepoImp.searchSkilles(name);
    return response;
  }

  @override
  savePortfoilo() async {
    if (keyForm.currentState!.validate()) {
      List? imagesIds;
      imagesIds = images.map((e) => e.id).toList();
      isloading.value = true;
      List allskilles = skilles.map((e) => e.id).toList();
      final response = await portfolioFreelancerRepoIm.storePortfolio(
          title.text,
          url.text,
          description.text,
          date,
          fileIds,
          imagesIds,
          allskilles,
          section.text);
      response.fold((error) {
        Get.snackbar("error", error);
        isloading.value = false;
      }, (portfolioModel) {
        isloading.value == false;
        showdialog();

        // showMyDialog();
      });
    }
  }

  showdialog() {
    Get.defaultDialog(
        actions: [
          MyButton(
            onPressed: () {
              section.clear();
              title.clear();
              url.clear();
              description.clear();
              date = "xxxx/xx/xx  ";

              images = [];
              filemodel = [];
              fileIds = [];
              update();
              Get.back();
              isloading.value = false;
            },
            child: Text("اضافة المزيد"),
            color: MyColors.greyColor,
          ),
          MyButton(
            onPressed: () {
              Get.toNamed(MyRoute.dashbord);
            },
            child: Text("التالي "),
            color: MyColors.blueColor,
          ),
        ],
        backgroundColor: MyColors.greyColor,
        titleStyle: font17greyw600,
        radius: 10,
        title: "تم حفظ المعرض بنجاح ",
        content: Text(
          "يمكنك اضافة المزيد من الأعمال ",
          textAlign: TextAlign.center,
          style: font15whitebold,
        ));
  }

  @override
  deletProtfolio() {}

  @override
  editPortfolio() async {
    //  final response = await portfolioFreelancerRepoIm
  }

  @override
  getPortfolio(int id) async {
    final response = await portfolioFreelancerRepoIm.getPortfolio(id);
    response.fold((erorr) => Get.snackbar("error", erorr), (portfolioModel) {
      print(portfolioModel);
    });
  }

  @override
  gotoMyProfile() {
    Get.toNamed(MyRoute.verfiymyprofileFreelancer);
  }

  @override
  removeItemForLIst(List list, int index) {
    list.removeAt(index);
    update();
  }

  @override
  selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      date = '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
      update();
    }
  }

  @override
  Future uploadFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      File selectedFile = File(result.files.single.path!);

      if (await checkSizeFile(selectedFile, "file")) {
        loadingFile = true;
        update();
        final response =
            await sharedApiFunctionIm.uploadFile(selectedFile, "files test");
        response.fold((error) => Get.snackbar("error", error), (modelFile) {
          filemodel.add(modelFile);
          fileIds.add(modelFile.id!);
          loadingFile = false;
          update();
        });
      } else {
        showSizeWarning();
      }
    }
  }

  @override
  addImage() async {
    var imagePicked = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      File imagefile = File(imagePicked.path);
      if (await checkSizeFile(imagefile, "image")) {
        var response = await sharedApiFunctionIm.uploadImage(imagefile);
        response.fold((error) => Get.snackbar("error", error), (imagemodel) {
          images.add(imagemodel);
          // imagesurl.add(imagemodel.url!);
          // imagesids.add(imagemodel.id!);
        });

        update();
      } else {
        showSizeWarning();
      }
    }
  }
}
