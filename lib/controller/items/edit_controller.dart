import 'dart:io';
import 'package:admin_app/controller/items/view_controller.dart';
import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/fileupload.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/data/datasourse/remote/categories/categories_data.dart';
import 'package:admin_app/data/datasourse/remote/items/items_data.dart';
import 'package:admin_app/data/model/categoriesmodel.dart';
import 'package:admin_app/data/model/itemsmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditItemsController extends GetxController {
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
  late TextEditingController active;
  //late TextEditingController cateName;
  //late TextEditingController cateId;
  ItemsModel? itemsModel;
  File? file;
  late String status;

  changeStatus(val) {
    status = val;
    update();
  }

  List<DropdownMenuItem<String>>? items = [
    const DropdownMenuItem<String>(value: "0", child: Text("0  =>  Hidden")),
    const DropdownMenuItem<String>(value: "1", child: Text("1  =>  Active")),
  ];

  chooseImageOption() {
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

  editData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text,
        "namear": nameAr.text,
        "desc": description.text,
        "descar": descriptionAr.text,
        "count": count.text,
        "active": status,
        "price": price.text,
        "discount": discount.text,
        "date": DateTime.now().toString(),
        "cateid": dropDownId.text,
        "id": itemsModel!.itemsId!.toString(),
        "oldimage": itemsModel!.itemsImage!,
      };
      var response = await itemsData.editData(data, file);
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
    itemsModel = Get.arguments['itemsModel'];
    name = TextEditingController();
    nameAr = TextEditingController();
    description = TextEditingController();
    descriptionAr = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    // cateName = TextEditingController();
    // cateId = TextEditingController();
    dropDownName = TextEditingController();
    dropDownId = TextEditingController();
    active = TextEditingController();

    name.text = itemsModel!.itemsName!;
    nameAr.text = itemsModel!.itemsNameAr!;

    description.text = itemsModel!.itemsDesc!;
    descriptionAr.text = itemsModel!.itemsDescAr!;
    status = itemsModel!.itemsActive.toString();
    count.text = itemsModel!.itemsCount!.toString();
    price.text = itemsModel!.itemsPrice!.toString();
    discount.text = itemsModel!.itemsDiscount!.toString();
    dropDownId.text = itemsModel!.categoriesId.toString();
    dropDownName.text = itemsModel!.categoriesName.toString();
   // active.text = itemsModel!.itemsActive.toString();
    // cateName.text = itemsModel!.categoriesName!.toString();
    // cateId.text = itemsModel!.categoriesId!.toString();

    super.onInit();
  }

  onChanged(String val) {
    active.text = val;
    update();
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
    dropDownId.dispose();
    dropDownName.dispose();
    active.dispose();
    super.dispose();
  }
}
