

import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class ArchieveOrdersData {
  Crud crud;
  ArchieveOrdersData(this.crud);
  archieveOrders() async {
    var response = await crud.postData(AppLink.viewArchieveOrders, {});
    return response.fold((l) => l, (r) => r);
  }


}
