import 'dart:async';
import 'dart:io';
import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/fileupload.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/data/datasourse/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SigupController extends GetxController {
  signUp();
  goToSigninPage();
}

class SigupControllerImp extends SigupController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  bool isShowPassword = true;
  StatusRequest statusRequest = StatusRequest.none;
  List data = [];
  SignupData signupData = SignupData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  File? file;
  bool isLoading = false;

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  chooseImageGallery() async {
    file = await fileUploadGallery(false);
    isLoading = true;
    Timer.periodic(const Duration(seconds: 4), (timer) {
      isLoading = false;
      update();
    });
      update();
  }

  chooseImageCamera() async {
    file = await imageUploadCamera();
    isLoading = true;
    
    Timer.periodic(const Duration(seconds: 4), (timer) {
      isLoading = false;
      update();
    });
      update();
  }

  chooseImageOption() {
    showBottomSheetMenu(chooseImageGallery, chooseImageCamera);
  }

  @override
  signUp() async {
    // var formData = formState.currentState;
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map mapData = {
        "username": username.text,
        "password": password.text,
        "email": email.text,
        "phone": phone.text,
      };
      var response = await signupData.signUpData(mapData, file);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRotes.verifyCodeSignUp, arguments: {
            "email": email.text,
          });
          file = null;
        } else {
          Get.defaultDialog(
            title: "54".tr,
            middleText: "211".tr,
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      Get.defaultDialog(
        title: "98".tr,
        middleText: "165.".tr,
      );
    }
  }

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  goToSigninPage() {
    Get.offNamed(AppRotes.login);
  }

  goToImagePage() {
    // var formData = formState.currentState;
    if (formState.currentState!.validate()) {
      Get.toNamed(AppRotes.addAdminImage);
    } else {
      // print("Not Valid");
      Get.defaultDialog(title: "98".tr, middleText: "165".tr);
    }
  }
}
