import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);
  postData(String email, String verifyCode) async {
    var response = await crud.postData(AppLink.verifyCodeForgetPassword, {
      "email": email,
      "verifycode": verifyCode ,
    });
    return response.fold((l) => l, (r) => r);
  }

   resendData(String email) async {
    var response = await crud.postData(AppLink.resendCode, {"email": email});
    return response.fold((l) => l, (r) => r);
  }

   getNotifyVerifyCode(String email) async {
    var response = await crud.postData(AppLink.getNotifyVerifyCodeData, {
      "email": email
    });
    return response.fold((l) => l, (r) => r);
  } 
}
