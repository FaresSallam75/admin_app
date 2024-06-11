import 'package:admin_app/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase(columnAr, columnEn) {
  MyServices myServices = Get.find();
  if (myServices.sharedPref.getString("lang") == "ar") {
    return columnAr;
  } else {
    return columnEn;
  }
}
