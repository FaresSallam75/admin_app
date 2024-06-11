import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/data/datasourse/remote/auth/verifycodesignup.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode(String code);
  resendCode();
  goToSuccessSignUp(String verifyCode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  String? email;
  String? verifyCode;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
    getNotifyCode();
  }

  @override
  goToSuccessSignUp(verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postData(email!, verifyCode);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(AppRotes.successSignUp);
      } else {
        Get.defaultDialog(
          title: "54".tr,
          middleText: "210".tr,
        );
        verifyCode;
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getNotifyCode() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.getNotifyVerifyCode(email!);
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
    verifyCodeSignUpData.resendData(email!);
    update();
  }
}
