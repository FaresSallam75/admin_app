import 'package:admin_app/view/screen/orders/accepted.dart';
import 'package:admin_app/view/screen/orders/archieve_orders.dart';
import 'package:admin_app/view/screen/orders/pending_orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderScreeenController extends GetxController {
  changePage(int currentPage);
}

class OrderScreeenControllerImp extends OrderScreeenController {
  int currentPage = 0;

  List<Widget> listPage = [
    const PendingOrders(),
    const AcceptedOrders(),
    const ArchievedOrders()
  ];

  //List textButtonAppBar = ["48".tr, "49".tr, "50".tr, "51".tr];
  List buttonAppBar = [
    {
      "title": "192".tr,
      "icon": Icons.home,
    },
    {
      "title": "193".tr,
      "icon": Icons.local_shipping_sharp,
    },
    {
      "title": "149".tr,
      "icon": Icons.archive_outlined,
    },
  ];

  @override
  // ignore: avoid_renaming_method_parameters
  changePage(int index) {
    currentPage = index;
    update();
  }
}
