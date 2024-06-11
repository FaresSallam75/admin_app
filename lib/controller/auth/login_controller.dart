import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/data/datasourse/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUpPage();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;

  StatusRequest statusRequest = StatusRequest.none;
  List data = [];
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();

  @override
  goToSignUpPage() {
    Get.offNamed(AppRotes.signUp);
  }

  bool isShowPassword = true;
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  login() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['admin_approve'] == 1 ||
              response['data']['admin_approve'] == "1") {
            myServices.sharedPref
                .setString("id", response['data']['admin_id'].toString());
            String adminId = myServices.sharedPref.getString("id")!;
            myServices.sharedPref
                .setString("username", response['data']['admin_name']);
            myServices.sharedPref
                .setString("email", response['data']['admin_email']);
            myServices.sharedPref
                .setString("phone", response['data']['admin_phone']);
            myServices.sharedPref.setString("valPassword", password.text);
          
            FirebaseMessaging.instance.subscribeToTopic("services");
            FirebaseMessaging.instance.subscribeToTopic("services$adminId");
            myServices.sharedPref.setString("step", "2");
            Get.offNamed(AppRotes.homePage);
          } else {
            Get.offNamed(AppRotes.verifyCodeSignUp,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
            title: "54".tr,
            middleText: "55".tr,
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("165".tr);
    }
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      // ignore: unused_local_variable
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRotes.forgetPassword);
  }
}
