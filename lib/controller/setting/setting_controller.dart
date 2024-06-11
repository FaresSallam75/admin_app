import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/core/localization/changetranslation.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/data/datasourse/remote/setting/updateProfileusers.dart';
import 'package:admin_app/data/model/adminmodel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  UpdateProfileUser updateProfileUser = UpdateProfileUser(Get.find());
  List<AdminModel> adminList = [];
  String? getUserName;
  String? getEmail;
  String? getImage;
  final switcherController = ValueNotifier<bool>(false);

  @override
  void onInit() {
    super.onInit();
    viewAdminData();
        switcherController.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    switcherController.dispose();
  }

  viewAdminData() async {
    adminList.clear();
    statusRequest = StatusRequest.loading;
    update();
    // ignore: unused_local_variable
    Map adminData = {
      "email": myServices.sharedPref.getString("email"),
      "password": myServices.sharedPref.getString("valPassword")
    };
    var response = await updateProfileUser.viewUserData(adminData);
    print("response response response ============================ $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        adminList.addAll(responseData.map((e) => AdminModel.fromJson(e)));
        getUserName = responseData[0]["admin_name"];
        getEmail    = responseData[0]["admin_email"];
        getImage    = responseData[0]["admin_image"];
        
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  logout() {
    String adminId = myServices.sharedPref.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("services");
    FirebaseMessaging.instance.unsubscribeFromTopic("services$adminId");
    myServices.sharedPref.clear();
    Get.offAllNamed(AppRotes.login);
    update();
  }

   changeLanguage(String codeLanguage)  {
    MyLocalController controller = Get.find();
    controller.changeLang(codeLanguage);
    update();
  }
}
