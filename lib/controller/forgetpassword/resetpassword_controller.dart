

import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/data/datasourse/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordComtroller extends GetxController {
  late TextEditingController password;
  late TextEditingController rePassword;
  String? email;



  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordComtrollerImp extends ResetPasswordComtroller {
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
   StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRotes.successResetPassword);
  }

   bool isShowPassword = true;
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  resetPassword() async {
    var formData = formState.currentState;
    if (password.text != rePassword.text) {
      return Get.defaultDialog(
        title: "Warning",
        middleText: "Password Not Match",
        titleStyle: const TextStyle(fontSize: 15, color: Colors.orange),
      );
    }

    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRotes.successResetPassword);
        } else {
          Get.defaultDialog(
            title: "Watchout",
            middleText: " Try Again",
            titleStyle: const TextStyle(fontSize: 15, color: Colors.orange),
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();

    super.dispose();
  }
}
