import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class InfoCompanyProfileController extends GetxController {
  next();
  onchangetypecompany(dynamic type);
  onchangesizecompany(dynamic size);
  addListnumberphone(List<int> listNumber);
  gotoHome();
}

class CompanyProfileControllerIm extends InfoCompanyProfileController {
  late GlobalKey<FormState> keyforone;
  late GlobalKey<FormState> keyfortow;
  late TextEditingController namecompany;
  late TextEditingController addresCity;
  late TextEditingController addresCountry;
  late TextEditingController descreptioncompany;
  late TextEditingController emailcompany;
  late List<int> numerphoecompany;
  late List<DropdownMenuItem<dynamic>> typecompany;
  late List<DropdownMenuItem<dynamic>> sizecompany;
   List<String> ?linksfacebook;
  var selectTypecompany;
  var selectsizecompany;

  @override
  gotoHome() {}

  @override
  next() {}
  @override
  void onInit() {
    addresCity = TextEditingController();
    keyforone = GlobalKey<FormState>();
    keyfortow = GlobalKey<FormState>();
    namecompany = TextEditingController();
    emailcompany = TextEditingController();
    addresCountry = TextEditingController();
    descreptioncompany = TextEditingController();
    numerphoecompany = [];
    typecompany = _itemstypecompany();
    sizecompany = _sizecompany();
    
    super.onInit();
  }

  @override
  onchangetypecompany(dynamic type) {
    selectTypecompany = type;
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
  onchangesizecompany(dynamic size) {
    selectsizecompany = size;
  }

  @override
  addListnumberphone(List<int> listNumber) {
    numerphoecompany = listNumber;
  }
}
