import 'package:admin_app/controller/orders/pending_orders_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/colors.dart';
import 'package:admin_app/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersListPending extends GetView<PendingOrdersController> {
  final OrdersModel ordersModel;
  const CardOrdersListPending({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "${"138".tr} : ${ordersModel.ordersId}",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontFamily: "sans"),
                ),
                const Spacer(),
                Text(
                  Jiffy.parse(ordersModel.ordersDatetime!).fromNow(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: AppColor.secondColor),
                ),
              ],
            ),
            const Divider(),
            // Text("Order Type : ${controller.printOrderType(ordersModel.ordersType!)} "),
            Text(
              "${"140".tr} : ${ordersModel.ordersPrice} \$ ",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontFamily: "sans"),
            ),
            Text(
              "${"142".tr} : ${ordersModel.ordersPricedelivery} \$ ",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontFamily: "sans"),
            ),
            Text(
              "${"142".tr} : ${controller.printPaymentMethod(ordersModel.ordersPaymentmethod!)} ",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontFamily: "sans"),
            ),
            Text(
              "${"143".tr} : ${controller.printOrderStatus(ordersModel.ordersStatus!)}",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontFamily: "sans"),
            ),
            const Divider(),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("${"78".tr} : ${ordersModel.ordersTotalprice} \$",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColor.secondColor)),
                const Spacer(),
                MaterialButton(
                  color: AppColor.thirdColor,
                  onPressed: () {
                    controller.goToPageOrderDetails(ordersModel);
                  },
                  child: Text(
                    "135".tr,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColor.secondColor),
                  ),
                ),
                const SizedBox(width: 10),
                if (ordersModel.ordersStatus == "0")
                  HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: MaterialButton(
                      color: AppColor.thirdColor,
                      onPressed: () {
                        controller.approveOrders(
                            ordersModel.ordersId!, ordersModel.ordersUsersid!);
                      },
                      child: Text("190".tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: AppColor.secondColor)),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
