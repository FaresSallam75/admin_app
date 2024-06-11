import 'package:admin_app/controller/orders/accepted_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/view/widget/orders/cardorderlistdone.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcceptedOrders extends StatelessWidget {
  const AcceptedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AcceptedOrdersController());
    return Container(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<AcceptedOrdersController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) =>
                CardOrdersListDone(ordersModel: controller.data[index]),
          ),
        ),
      ),
    );
  }
}
