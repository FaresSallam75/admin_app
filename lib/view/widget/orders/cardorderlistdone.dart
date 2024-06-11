import 'package:admin_app/controller/orders/accepted_controller.dart';
import 'package:admin_app/core/constant/colors.dart';
import 'package:admin_app/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersListDone extends GetView<AcceptedOrdersController> {
  final OrdersModel ordersModel;
  const CardOrdersListDone({super.key, required this.ordersModel});

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
                Text("${"138".tr} :  ${ordersModel.ordersId}",
                    style: Theme.of(context).textTheme.headlineSmall),
                const Spacer(),
                Text(Jiffy.parse(ordersModel.ordersDatetime!).fromNow(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColor.secondColor)),
              ],
            ),
            const Divider(),
            // Text("Order Type : ${controller.printOrderType(ordersModel.ordersType!)} "),
            Text("${"140".tr} : ${ordersModel.ordersPrice} \$ ",
                style: Theme.of(context).textTheme.headlineSmall),
            Text("${"141".tr} : ${ordersModel.ordersPricedelivery} \$ ",
                style: Theme.of(context).textTheme.headlineSmall),
            Text(
                "${"142".tr} : ${controller.printPaymentMethod(ordersModel.ordersPaymentmethod!)} ",
                style: Theme.of(context).textTheme.headlineSmall),
            // Text("Order Status : ${controller.printOrderStatus(ordersModel.ordersStatus!)}  "),
            const Divider(),
            Row(
              children: [
                Text(
                  "${"78".tr} : ${ordersModel.ordersTotalprice} \$",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: AppColor.secondColor),
                ),
                const Spacer(),
                MaterialButton(
                  color: AppColor.thirdColor,
                  onPressed: () {
                    controller.goToPageOrderDetails(ordersModel);
                  },
                  child: Text("135".tr,
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                const SizedBox(width: 10),
                if (ordersModel.ordersStatus == "1")
                  MaterialButton(
                    color: AppColor.thirdColor,
                    onPressed: () {
                      controller.donePrepare(ordersModel.ordersId!,
                          ordersModel.ordersUsersid!, ordersModel.ordersType!);
                    },
                    child: Text("191".tr,
                        style: Theme.of(context).textTheme.headlineSmall),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
