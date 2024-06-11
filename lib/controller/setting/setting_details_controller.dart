/* import 'dart:async';
import 'dart:io';

import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/fileupload.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/data/datasourse/remote/setting/updateProfileusers.dart';
import 'package:admin_app/data/model/adminmodel.dart';
import 'package:get/get.dart';

class SettingsDetailsController extends GetxController {
  File? file;
  StatusRequest statusRequest = StatusRequest.none;
  UpdateProfileUser updateProfileUser = UpdateProfileUser(Get.find());
  bool isLoading = false;
  MyServices myServices = Get.find();
   AdminModel? adminModel;

  chooseImageGallery() async {
    file = await fileUploadGallery(false);
    if (file != null) {
      isLoading = true;
      Timer.periodic(const Duration(seconds: 4), (timer) {
        isLoading = false;
        update();
      });
    }
    update();
  }

  chooseImageCamera() async {
    file = await imageUploadCamera();
    if (file != null) {
      isLoading = true;
      Timer.periodic(const Duration(seconds: 4), (timer) {
        isLoading = false;
        update();
      });
    }
    update();
  }

 /*  chooseImageOption() {
    showBottomSheetMenuImage(chooseImageGallery, chooseImageCamera);
    update();
  } */

  editData() async {
    // if (formState.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
/*     Map data = {};
    if(adminModel!.adminImage != "" || adminModel!.adminImage!.isNotEmpty) {
         data = {"userid": adminModel!.adminId, "oldimage": adminModel!.adminImage };
    }else{ 
      data = {"userid": adminModel!.adminId, "oldimage": " " };
    } */

    var response = await updateProfileUser.viewUserData(adminModel!.adminEmail!, adminModel!.adminImage!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        /*     isLoading = true;
        update();
        await Future.delayed(const Duration(seconds: 3));
        Get.offNamed(AppRotes.homePage); */
        file = null;

        Get.offAllNamed(AppRotes.homePage);
        /*    Get.delete<SettingsController>();
        SettingsController con = Get.put(SettingsController());
        con.onInit();
        Get.delete<HomePageControllerImp>(); */

        //  Get.delete<SettingsController>();
        //   SettingsController c = Get.put(SettingsController());
        // c.refreshPage();
      } else {
        // isLoading = false;
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    // }
  }

  @override
  void onInit() {
    //adminModel = Get.arguments['userModel'];
    super.onInit();
  }

  @override
  void onClose() {
    file = null;
    super.onClose();
  }
}
 */