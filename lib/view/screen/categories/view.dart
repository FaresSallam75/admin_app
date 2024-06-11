import 'package:admin_app/controller/categories/view_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/colors.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/translatedatabase.dart';
import 'package:admin_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class ViewCategories extends StatelessWidget {
  const ViewCategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewCategoriesController());
    return Scaffold(
      appBar: AppBar(
        title: Text("60".tr),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRotes.addCategories);
        },
        child: const Icon(Icons.add, color: AppColor.backGround),
      ),
      body: GetBuilder<ViewCategoriesController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          // ignore: deprecated_member_use
          widget: WillPopScope(
            onWillPop: () {
              // ignore: void_checks
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
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: SvgPicture.network(
                                  height: 80,
                                  "${AppLink.imageCategories}/${controller.data[index].categoriesImage}"),
                            )),
                        Expanded(
                          flex: 3,
                          child: ListTile(
                            title: Text(
                                "${translateDatabase(controller.data[index].categoriesNameAr, controller.data[index].categoriesName)}"),
                            subtitle: Text(
                              Jiffy.parse(
                                      "${controller.data[index].categoriesDatetime}")
                                  .yMMMMd,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 15,
                                    fontFamily: "sans",
                                  ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: "154".tr,
                                      middleText: "168".tr,
                                      confirmTextColor: AppColor.backGround,
                                      buttonColor: AppColor.secondColor,
                                      onConfirm: () {
                                        controller.deleteCategory(
                                            controller
                                                .data[index].categoriesId!,
                                            controller
                                                .data[index].categoriesImage!);
                                        Get.back();
                                      },
                                    );
                                  },
                                  icon:
                                      const Icon(Icons.delete_outline_outlined),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
