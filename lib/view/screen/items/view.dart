import 'package:admin_app/controller/items/view_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/colors.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/translatedatabase.dart';
import 'package:admin_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class ViewItems extends StatelessWidget {
  const ViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewItemsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("167".tr),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRotes.addItems);
        },
        child: const Icon(Icons.add, color: AppColor.backGround),
      ),
      body: GetBuilder<ViewItemsController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          // ignore: deprecated_member_use
          widget: WillPopScope(
            onWillPop: () {
              return controller.back();
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 70),
              child: ListView.builder(
                itemCount: controller.data.length, //CachedNetworkImage()
                itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      controller.goToPageEdit(controller.data[index]);
                    },
                    child: //controller.data[index].itemsActive == 1
                        Card(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${AppLink.imageItems}/${controller.data[index].itemsImage}",
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              )),
                          Expanded(
                            flex: 3,
                            child: ListTile(
                              title: Text(
                                  "${translateDatabase(controller.data[index].itemsNameAr, controller.data[index].itemsName)}"),
                              subtitle: Text(
                                  "${translateDatabase(controller.data[index].categoriesNameAr, controller.data[index].categoriesName)}"),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                        title: "154".tr,
                                        middleText: "175".tr,
                                        confirmTextColor: AppColor.backGround,
                                        buttonColor: AppColor.secondColor,
                                        onConfirm: () {
                                          controller.deleteItems(
                                              controller.data[index].itemsId!
                                                  .toString(),
                                              controller
                                                  .data[index].itemsImage!);
                                          Get.back();
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                        Icons.delete_outline_outlined),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                    //: Container()
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
