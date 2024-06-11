import 'package:admin_app/core/constant/theme.dart';
import 'package:admin_app/core/function/fcmc.config.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class MyLocalController extends GetxController {
  late Locale language;

  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;

  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPref.setString("lang", langCode);
    appTheme = langCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  requestPermissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("54".tr, "207".tr);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("54".tr, "208".tr);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("54".tr, "209".tr);
      Geolocator.openAppSettings();
    }
    requestPermissionNotifications();
    fcmsConfigration();
  }

  @override
  void onInit() {
    requestPermissionLocation();
    String? shredPrefLang = myServices.sharedPref.getString("lang");
    if (shredPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (shredPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}

/* 
language = myServices.sharedPref.getString("lang") == null
        ? Get.deviceLocale!
        : Locale(myServices.sharedPref.getString("lang")!); */