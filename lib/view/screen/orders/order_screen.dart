import 'package:admin_app/controller/orders/order_screen_controller.dart';
import 'package:admin_app/view/widget/homepage/custombuttonappbarhomeoage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersHome extends StatelessWidget {
  const OrdersHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreeenControllerImp());
    return GetBuilder<OrderScreeenControllerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text("111".tr),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomButtonAppBarHomePage(),
        body: controller.listPage.elementAt(controller.currentPage),
      ),
    );
  }
}
