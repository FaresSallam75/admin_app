import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class DeliveryData {
  Crud crud;
  DeliveryData(this.crud);

  deliveryData() async {
    var response = await crud.postData(AppLink.viewDeliveryMen, { 
  
    });
    return response.fold((l) => l, (r) => r);
  }

  approveDeliveryData(String deliveryId) async {
    var response = await crud.postData(AppLink.approveDeliveryMen, { 
      "deliveryId" : deliveryId
    });
    return response.fold((l) => l, (r) => r);
  } 


}
