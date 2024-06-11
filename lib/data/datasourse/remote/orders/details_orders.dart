
import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class DetailsOrdersData {
  Crud crud;
  DetailsOrdersData(this.crud);
  detailsOrders(String ordersId) async {
    var response = await crud.postData(AppLink.viewDetailsOrders, {
      "ordersid" : ordersId
    });
    return response.fold((l) => l, (r) => r);
  }
}
