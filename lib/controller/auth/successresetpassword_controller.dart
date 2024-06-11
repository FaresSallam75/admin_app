import 'package:admin_app/core/constant/rotesname.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToPageLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToPageLogin() {
     Get.offAllNamed(AppRotes.login);
  }
}
