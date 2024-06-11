import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/data/datasourse/remote/forgetpassword/verifycode.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(String code);
  resendCode();
  goToResetPassword(verifyCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  String? verifyCode;
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
    getNotifyCode();
  }

  @override
  goToResetPassword(verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeForgetPasswordData.postData(email!, verifyCode!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(AppRotes.resetPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
          title: "54".tr,
          middleText: "210".tr,
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

   getNotifyCode() async {
    statusRequest = StatusRequest.loading;
   update();
    var response = await verifyCodeForgetPasswordData.getNotifyVerifyCode(email!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {}
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  checkCode(code) {
    verifyCode != code;
    code = "";
    update();
  }

  @override
  resendCode() {
    verifyCodeForgetPasswordData.resendData(email!);
    update();
  }
}
