import 'package:admin_app/core/localization/changetranslation.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomePageControllerImp extends GetxController {
  MyServices myServices = Get.find();
  bool isVal = false;
  final switcherController = ValueNotifier<bool>(false);
 
  @override
  void onInit() {
    super.onInit();
    switcherController.addListener(() {});
  }

  @override
  dispose() {
    super.dispose();
    switcherController.dispose();
  }

  changeLanguage(String codeLanguage)  {
    MyLocalController controller = Get.find();
    controller.changeLang(codeLanguage);
    update();
  }
}
