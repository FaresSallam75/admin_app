import 'dart:io';
import 'package:admin_app/controller/categories/view_controller.dart';
import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/fileupload.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/data/datasourse/remote/categories/categories_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategoriesController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  CategoriesData categoriesData = CategoriesData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController nameAr;
  File? file;

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  addData() async {
    if (formState.currentState!.validate()) {
      if (file == null) Get.snackbar("Warning", "Please Chhose Image Svg");
      statusRequest = StatusRequest.loading;
      update();
      Map data = {"name": name.text, "namear": nameAr.text};
      var response = await categoriesData.addDataWithFile(data, file!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRotes.viewcategories);
          ViewCategoriesController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    nameAr = TextEditingController();
    // getData();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    nameAr.dispose();
    super.dispose();
  }
}
