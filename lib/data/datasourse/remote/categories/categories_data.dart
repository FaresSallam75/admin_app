import 'dart:io';

import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);

  viewData() async {
    var response = await crud.postData(AppLink.categoriesView, {});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    var response = await crud.postData(AppLink.categoriesDelete, data);
    return response.fold((l) => l, (r) => r);
  }

  editData(Map data , [File? file]) async {
    var response;
    if(file == null){
           response = await crud.postData(AppLink.categoriesEdit, data);
    }else{
            response = await crud.postRequestWithFile(AppLink.categoriesEdit, data , file);
    }
   
    return response.fold((l) => l, (r) => r);
  }

  addDataWithFile(Map data, File file) async {
    var response =
        await crud.postRequestWithFile(AppLink.categoriesAdd, data, file);
    return response.fold((l) => l, (r) => r);
  }
}
