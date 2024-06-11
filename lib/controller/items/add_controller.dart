import 'dart:io';
import 'package:admin_app/controller/items/view_controller.dart';
import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/fileupload.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/data/datasourse/remote/categories/categories_data.dart';
import 'package:admin_app/data/datasourse/remote/items/items_data.dart';
import 'package:admin_app/data/model/categoriesmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItemsController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<SelectedListItem> drobDownSearch = [];
  late TextEditingController dropDownName;
  late TextEditingController dropDownId;
  late TextEditingController name;
  late TextEditingController nameAr;
  late TextEditingController description;
  late TextEditingController descriptionAr;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;
  File? file;

  //late TextEditingController cateName;
  //late TextEditingController    cateId;

  
  chooseImage() {
    showBottomSheetMenu(chooseImageGallery, chooseImageCamera);
  }

  chooseImageGallery() async {
    file = await fileUploadGallery(false);
    update();
  }

  chooseImageCamera() async {
    file = await imageUploadCamera();
    update();
  }

  addData() async {
    if (formState.currentState!.validate()) {
      if (file == null) Get.snackbar("Warning", "Please Chhose Image");
      statusRequest = StatusRequest.loading;
      update();
      //categoryId = dropDownId.text;
      Map data = {
        "name": name.text,
        "namear": nameAr.text,
        "desc": description.text,
        "descar": descriptionAr.text,
        "count": count.text,
        "price": price.text,
        "discount": discount.text,
        "date": DateTime.now().toString(),
        "cateid": dropDownId.text,
      };
      var response = await itemsData.addDataWithFile(data, file!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRotes.viewItems);
          ViewItemsController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  getCategories() async {
    CategoriesData categoriesData = CategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    var response = await categoriesData.viewData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<CategoriesModel> data = [];
        List responseData = response['data'];
        data.addAll(responseData.map((e) => CategoriesModel.fromJson(e)));
        for (int i = 0; i < data.length; i++) {
          drobDownSearch.add(
            SelectedListItem(
                name: data[i].categoriesName!, value: data[i].categoriesId),
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getCategories();
    name = TextEditingController();
    nameAr = TextEditingController();
    description = TextEditingController();
    descriptionAr = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    dropDownName = TextEditingController();
    dropDownId = TextEditingController();
   
    // getData();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    nameAr.dispose();
    description.dispose();
    descriptionAr.dispose();
    count.dispose();
    price.dispose();
    discount.dispose();
    dropDownName.dispose();
    dropDownId.dispose();
   
    super.dispose();
  }
}
