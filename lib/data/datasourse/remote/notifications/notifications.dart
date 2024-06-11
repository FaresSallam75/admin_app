import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class NotificationsData {
  Crud crud;
  NotificationsData(this.crud);
  
  getNotifications() async {
    var response = await crud.postData(AppLink.notificationsData, {
 
    });
    return response.fold((l) => l, (r) => r);
  }
}
