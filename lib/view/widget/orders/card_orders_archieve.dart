import 'package:admin_app/controller/orders/archieve_orders_controller.dart';
import 'package:admin_app/core/constant/colors.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersArchieve extends GetView<ArchieveOrdersController> {
  final OrdersModel ordersModel;
  const CardOrdersArchieve({super.key, required this.ordersModel});

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
            Text(
                "${"139".tr} : ${controller.printOrderType(ordersModel.ordersType!)}",
                style: Theme.of(context).textTheme.headlineSmall),
            Text("${"140".tr} : ${ordersModel.ordersPrice} \$ ",
                style: Theme.of(context).textTheme.headlineSmall),
            Text("${"141".tr} : ${ordersModel.ordersPricedelivery} \$ ",
                style: Theme.of(context).textTheme.headlineSmall),
            Text(
                "${"142".tr} : ${controller.printPaymentMethod(ordersModel.ordersPaymentmethod!)}",
                style: Theme.of(context).textTheme.headlineSmall),
            Text(
                "${"143".tr} : ${controller.printOrderStatus(ordersModel.ordersStatus!)}",
                style: Theme.of(context).textTheme.headlineSmall),
            const Divider(),
            Row(
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
                    Get.toNamed(AppRotes.ordersDetails,
                        arguments: {"ordersmodel": ordersModel});
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
                /*   if (ordersModel.ordersRating == "0")
                  MaterialButton(
                    color: AppColor.thirdColor,
                    onPressed: () {
                      showDialogRating(context, ordersModel.ordersId!);
                    },
                    child: const Text(
                      "Rating",
                      style: TextStyle(color: AppColor.secondColor),
                    ),
                  ), */
              ],
            )
          ],
        ),
      ),
    );
  }
}
