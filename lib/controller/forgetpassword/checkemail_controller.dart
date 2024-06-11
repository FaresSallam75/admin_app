import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/data/datasourse/remote/forgetpassword/checkemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  bool isShowPassword = true;

   
     @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  checkemail() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRotes.verifyCode, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
            title: "Watchout",
            middleText: " Email Not Found",
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }


}
