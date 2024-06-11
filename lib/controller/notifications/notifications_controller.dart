import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/data/datasourse/remote/notifications/notifications.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationsController extends GetxController {
  NotificationsData notificationsData = NotificationsData(Get.find());
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    super.onInit();
    getNotificationsData();
   // defineLanguage();
  }

  defineLanguage() async {
    print("======================= start of service ");
    myServices.sharedPref.getString("lang") == "ar"
        ? await Jiffy.setLocale("ar")
        : await Jiffy.setLocale("en");
    update();
    print("======================= end of service ");
  }

  getNotificationsData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationsData.getNotifications();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
