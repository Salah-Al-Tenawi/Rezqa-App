import 'package:get/get.dart';

inputvaild(String val, String ?type, int max, int min) {
  if (val.isEmpty) {
    return "لا يمكن ترك الحقل فارغ";
  }

  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "اسم المستخدم غير صالح";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "بريد إلكتروني غير صالح";
    }
  }
  if (type == "nubmerphone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "رقم هاتف غير صالح";
    }
  }
  if (type == "url") {
    if (!GetUtils.isURL(val)) {
      return "رابط إلكتروني غير صالح";
    }
  }

  if (val.length < min) {
    switch (type) {
      case "username":
        {
          return "اسم المستجدم يجب ان يكون أكبر من $min أحرف";
        }
      case "password":
        {
          return "كلمة المرور يجب ان تكون  أكبر من $min أحرف أو رموز";
        }
    }
  }
  if (val.length > max) {
    switch (type) {
      case "username":
        {
          return "اسم المستجدم يجب ان يكون أصغر من $max أحرف";
        }
      case "password":
        {
          return "كلمة المرور يجب ان تكون  أصغر من $max حرف أو رمز";
        }
    }
  }
}
