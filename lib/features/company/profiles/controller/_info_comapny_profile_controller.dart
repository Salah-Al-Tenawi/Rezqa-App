import 'package:flutter/material.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:freelanc/core/widgets/custom_listtile.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

abstract class InfoCompanyProfileController extends GetxController {
  nextpage();
  goprofile();
  saveprofile();
  editprofile();
  addgallary();
  changType(String type);
  changSize(String size);
  addnumberphone(String number);
  addlinkcontact(String url);
  showlistdialog(List list);
  addlink(String url);
  addImagefront();
  addImageback();
}

class CompanyProfileControllerIm extends InfoCompanyProfileController {
  late GlobalKey<FormState> keyformone;
  late GlobalKey<FormState> keyformtow;
  late TextEditingController name;
  late TextEditingController state;
  late TextEditingController location;
  late TextEditingController descrption;
  late TextEditingController email;
  late TextEditingController cruntephone;
  late TextEditingController cruntelinks;
  late List<String> numbersphone;
  late List<String> linkescontact;
  late List type;
  late List size;
  List<String>? linkscontact;
  String? selectType;
  String? selectsize;
  late ImagePicker imagePicker;
  File? imagefront;
  File? imageback;
// the logic
  @override
  void onInit() {
    keyformone = GlobalKey<FormState>();
    keyformtow = GlobalKey<FormState>();
    state = TextEditingController();
    name = TextEditingController();
    email = TextEditingController();
    location = TextEditingController();
    descrption = TextEditingController();
    cruntephone = TextEditingController();
    cruntelinks = TextEditingController();
    imagePicker = ImagePicker();
    numbersphone = [];
    linkescontact = [];
    type = ["sljfdk", "sdjfkdf", "dsjkdf"];
    size = [
      "أقل من 10 موظفين",
      "10 - 50 موظف",
      "50 - 100 موظف",
      "أكثر من 100 موظف"
    ];
    selectsize = "أقل من 10 موظفين";
    selectType = "";
    super.onInit();
  }

  @override
  nextpage() {
    if (keyformone.currentState!.validate()) {
      Get.toNamed(
        MyRoute.infoprofilecompanytow,
      );
    }
  }

  @override
  goprofile() {
    if (keyformtow.currentState!.validate()) {
      Get.toNamed(MyRoute.verfiymyprofilecompany);
    }
  }

  @override
  changType(String type) {
    selectType = type;
  }

  @override
  changSize(String size) {
    selectsize = size;
  }

  @override
  addnumberphone(String number) {
    if (!numbersphone.contains(number) && number.length == 10) {
      numbersphone.add(number);
    } else if (number.length != 10) {
      Get.snackbar("حطأ", "يجب ان يكون الرقم 10 أرقام");
    } else {
      Get.snackbar("موجود بالفعل", 'لا يمكن اضافة نفس الرقم اكثر من مرة');
    }
    update();
  }

  @override
  addlink(String url) {
    if (!linkescontact.contains(url)) {
      linkescontact.add(url);
    } else {
      Get.snackbar("موجود بالفعل", 'لا يمكن اضافة نفس الرابط اكثر من مرة');
    }
    update();
  }

  @override
  addlinkcontact(String url) {
    linkscontact?.add(url);
    update();
  }

  @override
  addgallary() {
    throw UnimplementedError();
  }

  @override
  editprofile() {
    Get.back();
  }

  @override
  saveprofile() {
    throw UnimplementedError();
  }

  @override
  showlistdialog(List list) {
    Get.dialog(Material(
      child: GetBuilder<CompanyProfileControllerIm>(builder: (_) {
        return SizedBox(
          width: double.infinity,
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return CustomListTile(
                  width: 50,
                  height: 50,
                  title: list[index],
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              deletitem(index, list);
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
              }),
        );
      }),
    ));
  }

  deletitem(int index, List list) {
    list.removeAt(index);
    update();
  }

  @override
  addImageback() async {
    var imagePicked = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      imageback = File(imagePicked.path);
      update();
    }
  }

  @override
  addImagefront() async {
    var imagePicked = await imagePicker.pickImage(source: ImageSource.camera);
    if (imagePicked != null) {
      imagefront = File(imagePicked.path);
      update();
    }
  }

  
  // }

  // Future  _launchUrl(String link) async {
  //   final _url = Uri.parse(link);
  //   if (!await launchUrl(_url)) {
  //     throw Exception('Could not launch $_url');
  //   }
  // }
}


// final Uri _url = Uri.parse('https://flutter.dev');

// void main() => runApp(
//       const MaterialApp(
//         home: Material(
//           child: Center(
//             child: ElevatedButton(
//               onPressed: _launchUrl,
//               child: Text('Show Flutter homepage'),
//             ),
//           ),
//         ),
//       ),
//     );
