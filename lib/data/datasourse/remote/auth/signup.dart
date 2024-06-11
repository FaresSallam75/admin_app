import 'dart:io';

import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  signUpData(Map data, [File? file]) async {
    // ignore: prefer_typing_uninitialized_variables
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.signup, data);
    } else {
      response = await crud.postRequestWithFile(AppLink.signup, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }
}
