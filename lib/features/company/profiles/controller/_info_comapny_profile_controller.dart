import 'package:flutter/material.dart';
import 'package:freelanc/core/route/routes.dart';
import 'package:get/get.dart';

abstract class InfoCompanyProfileController extends GetxController {
  gototowinfopage();
  gotoVerfiymyprofile();
  saveprofile();
  editprofile();
  addgallary();
  onchangetypecompany(dynamic type);
  onchangesizecompany(dynamic size);
  addnumberphone(String number);
  showlastnumber();
}

class CompanyProfileControllerIm extends InfoCompanyProfileController {
  late GlobalKey<FormState> keyforone;
  late GlobalKey<FormState> keyfortow;
  
  late TextEditingController namecompany;
  late TextEditingController addresCity;
  late TextEditingController addresCountry;
  late TextEditingController descreptioncompany;
  late TextEditingController emailcompany;
  late TextEditingController numberphone;
  late List<String> numerphoecompany;
  late List<DropdownMenuItem<dynamic>> typecompany;
  late List<DropdownMenuItem<dynamic>> sizecompany;
  List<String>? linksfacebook;
  String? selectTypecompany;
  String? selectsizecompany;

  @override
  gototowinfopage() {
    // if (keyforone.currentState!.validate()) {
    Get.toNamed(
      MyRoute.infoprofilecompanytow,
    );
    // }
  }

  @override
  gotoVerfiymyprofile() {
    // if (keyfortow.currentState!.validate()) {
    Get.toNamed(MyRoute.verfiymyprofilecompany);
    // }
  }

  @override
  onchangetypecompany(var type) {
    selectTypecompany = type;
  }

  @override
  onchangesizecompany(var size) {
    selectsizecompany = size;
  }

  @override
  addnumberphone(String number) {
    numerphoecompany.add(number);
    update();
  }

  @override
  addgallary() {
    // TODO: implement addgallary
    throw UnimplementedError();
  }

  @override
  editprofile() {
    Get.back();
  }

  @override
  saveprofile() {
    // TODO: implement saveprofile
    throw UnimplementedError();
  }

  @override
  void onInit() {
    addresCity = TextEditingController();
    keyforone = GlobalKey<FormState>();
    keyfortow = GlobalKey<FormState>();
    namecompany = TextEditingController();
    emailcompany = TextEditingController();
    addresCountry = TextEditingController();
    descreptioncompany = TextEditingController();
    numberphone = TextEditingController();
    numerphoecompany = [];
    typecompany = _itemstypecompany();
    sizecompany = _sizecompany();

    super.onInit();
  }

  List<DropdownMenuItem<dynamic>> _itemstypecompany() {
    List<DropdownMenuItem<dynamic>> item =
        ["تطوير البرمجيات ", "تجارة و تسويق ", "تصميم "]
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList();

    return item;
  }

  List<DropdownMenuItem<dynamic>> _sizecompany() {
    List<DropdownMenuItem<dynamic>> item =
        ["20 - 30 موظف ", "30 - 50 موظف", "50 - 100 موظف  ", "  100  أو أكثر "]
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList();
    return item;
  }

  @override
  showlastnumber() {
    numberphone.text = numerphoecompany.last;
    numerphoecompany.removeLast();
    print(numerphoecompany);
  }
}
