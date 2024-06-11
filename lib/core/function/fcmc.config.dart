import 'package:admin_app/controller/delivery/view_controller.dart';
import 'package:admin_app/controller/orders/pending_orders_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

import '../constant/rotesname.dart';

requestPermissionNotifications() async {
  // ignore: unused_local_variable
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmsConfigration() {
  FirebaseMessaging.onMessage.listen((message) {
    print("==================== Notifications  ================");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer.playNotification();
    // Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshOrderNotification(message.data);
  });
}

refreshOrderNotification(data) {
  print("pade id ============================");
  data['pageid'];
  print("pade name ============================");
  data['pagename'];

  print("current Rote  ${Get.currentRoute} ========================= ");
  if (Get.currentRoute == "/deliveryPage" &&
      data['pagename'] == "refreshorder") {
    ViewDeliveryController controller = Get.find();
    controller.viewDeliveryData();
  } else if (Get.currentRoute == "/pendingorders" &&
      data['pagename'] == "refreshorder") {
    PendingOrdersController pendingOrdersController = Get.find();
    pendingOrdersController.refreshOrderPage();
  }
}
