import 'dart:io';
import 'package:admin_app/controller/categories/view_controller.dart';
import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/fileupload.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/data/datasourse/remote/categories/categories_data.dart';
import 'package:admin_app/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCategoriesController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  CategoriesData categoriesData = CategoriesData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController name;
  late TextEditingController nameAr;
  File? file;
  CategoriesModel? categoriesModel;

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  editData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "id": categoriesModel!.categoriesId!.toString(),
        "name": name.text,
        "namear": nameAr.text,
        "oldimage": categoriesModel!.categoriesImage!
      };
      var response = await categoriesData.editData(data, file);
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
    categoriesModel = Get.arguments['categoriesModel'];
    name = TextEditingController();
    nameAr = TextEditingController();
    name.text = categoriesModel!.categoriesName!;
    nameAr.text = categoriesModel!.categoriesNameAr!;
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
