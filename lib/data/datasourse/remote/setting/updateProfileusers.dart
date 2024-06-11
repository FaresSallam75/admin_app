import 'dart:io';
import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class UpdateProfileUser {
  Crud crud;
  UpdateProfileUser(this.crud);

 /*  updateData(Map data , [File? file]) async {
    var response = await crud.postRequestWithFile(AppLink.updateProfilrUser, data , file!);
    return response.fold((l) => l, (r) => r);
  } */
   

    viewUserData(Map data) async {
    var response = await crud.postData(AppLink.viewUserProfile, data);
    return response.fold((l) => l, (r) => r);
  }

}
