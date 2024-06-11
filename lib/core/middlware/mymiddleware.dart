
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPref.getString("step") == "2") {
      return const RouteSettings(name: AppRotes.homePage);
    }
    if (myServices.sharedPref.getString("step") == "1") {
      return const RouteSettings(name: AppRotes.login);
    }
    return null;
  }
}
