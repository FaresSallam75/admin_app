import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class AcceptedOrdersData {
  Crud crud;
  AcceptedOrdersData(this.crud);
  acceptedOrders() async {
    var response = await crud.postData(AppLink.viewAcceptedOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  prepareOrders(String ordersId, String usersId, String orderType) async {
    var response = await crud.postData(AppLink.prepareOrders,
        {"ordersid": ordersId, "usersid": usersId, "ordertype": orderType});
    return response.fold((l) => l, (r) => r);
  }
}
