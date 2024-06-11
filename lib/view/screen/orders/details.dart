import 'package:admin_app/controller/orders/orders_details_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/colors.dart';
import 'package:admin_app/core/function/translatedatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("130".tr),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrdersDetailsController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Table(
                          border: TableBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          children: [
                            TableRow(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.vertical(
                                          bottom: Radius.circular(20.0)),
                                  color: AppColor.thirdColor),
                              children: [
                                Text("167".tr,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                                Text("132".tr,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                                Text("76".tr,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall)
                              ],
                            ),
                            ...List.generate(
                              controller.data.length,
                              (index) => TableRow(
                                children: [
                                  Text(
                                      "${translateDatabase(controller.data[index].itemsNameAr, controller.data[index].itemsName)}",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                  Text("${controller.data[index].countitems}",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                  Text(
                                      "${controller.data[index].itemsprice} \$",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall)
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                              "${"76".tr} : ${controller.ordersModel.ordersPrice} \$",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineSmall),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                              "${"133".tr} : ${controller.ordersModel.ordersPricedelivery} \$",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineSmall),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                              "${"78".tr} : ${controller.ordersModel.ordersTotalprice} \$",
                              textAlign: TextAlign.center,
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                        ),
                      ],
                    ),
                  ),
                ),
                if (controller.ordersModel.ordersType == "0")
                  Card(
                    margin: const EdgeInsets.only(top: 10),
                    child: ListTile(
                      title: Text(
                        "87".tr,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      subtitle: Text(
                        "${controller.ordersModel.addressCity}  ${controller.ordersModel.addressStreet} ",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: AppColor.secondColor),
                      ),
                    ),
                  ),
                if (controller.ordersModel.ordersType == "0")
                  Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      height: 300,
                      width: double.infinity,
                      child: GoogleMap(
                        markers: controller.markers.toSet(),
                        mapType: MapType.normal,
                        initialCameraPosition: controller.cameraPosition!,
                        onMapCreated: (GoogleMapController controllerMap) {
                          controller.completerController
                              .complete(controllerMap);
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
