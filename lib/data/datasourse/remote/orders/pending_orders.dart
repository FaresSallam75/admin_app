import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class PendingOrdersData {
  Crud crud;
  PendingOrdersData(this.crud);
  pendingOrders() async {
    var response = await crud.postData(AppLink.viewPendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrders(String ordersId, String usersId) async {
    var response = await crud.postData(AppLink.pendingOrders, {
      "ordersid": ordersId,
      "usersid": usersId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
