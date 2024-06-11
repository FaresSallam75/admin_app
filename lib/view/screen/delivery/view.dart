import 'package:admin_app/controller/delivery/view_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewDeliveryMen extends StatelessWidget {
  const ViewDeliveryMen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewDeliveryController());
    return Scaffold(
      appBar: AppBar(
        title: Text("197".tr),
      ),
      body: GetBuilder<ViewDeliveryController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest!,
          widget: ListView(
            children: [
              ...List.generate(
                controller.deliveryModel.length,
                (index) {
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    color: AppColor.thirdColor.withOpacity(0.8),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${"198".tr} :   ${controller.deliveryModel[index].deliveryId}",
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          Text(
                            "${"199".tr} :   ${controller.deliveryModel[index].deliveryName}",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                              "${"200".tr} :   ${controller.deliveryModel[index].deliveryEmail}",
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          Text(
                              "${"201".tr} :   ${controller.deliveryModel[index].deliveryPhone}",
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          Text(
                              "${"202".tr} :   ${controller.deliveryModel[index].approve == "0" ? "145".tr : "190".tr}",
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          if (controller.deliveryModel[index].approve == "0")
                            /*  Container(
                              alignment: Alignment.bottomRight,
                              child: CustomButtonDefault(
                                text: "approve",
                                onBressed: () {
                                  controller.approveDeliveryData(controller
                                      .deliveryModel[index].deliveryId!);
                                },
                              ),
                            ) */
                            Container(
                              alignment: Alignment.center,
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                color: AppColor.secondColor,
                                onPressed: () {
                                  controller.approveDeliveryData(controller
                                      .deliveryModel[index].deliveryId!);
                                },
                                child: Text(
                                  "190".tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          color: AppColor.backGround,
                                          fontSize: 17.0),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
