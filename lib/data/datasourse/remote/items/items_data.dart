import 'dart:io';

import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  viewData() async {
    var response = await crud.postData(AppLink.itemsView, {});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    var response = await crud.postData(AppLink.itemsDelete, data);
    return response.fold((l) => l, (r) => r);
  }

  editData(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.itemsEdit, data);
    } else {
      response = await crud.postRequestWithFile(AppLink.itemsEdit, data, file);
    }

    return response.fold((l) => l, (r) => r);
  }

  addDataWithFile(Map data, File file) async {
    var response = await crud.postRequestWithFile(AppLink.itemsAdd,data, file);
    return response.fold((l) => l, (r) => r);
  }
}
