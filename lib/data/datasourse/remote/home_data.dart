/* 
import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/linkapi.dart';

class HomePageData {
  Crud crud;
  HomePageData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.homePage, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(AppLink.searchItems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
 */