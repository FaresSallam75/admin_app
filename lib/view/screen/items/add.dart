import 'package:admin_app/controller/items/add_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/colors.dart';
import 'package:admin_app/core/function/validinput.dart';
import 'package:admin_app/core/shared/customdropdownsearch.dart';
import 'package:admin_app/core/shared/customtestformgeneral.dart';
import 'package:admin_app/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItems extends StatelessWidget {
  const AddItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddItemsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("176".tr),
      ),
      body: GetBuilder<AddItemsController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustoemTextFormGeneral(
                    labl: "177".tr,
                    hinText: "178".tr,
                    iconData: Icons.card_travel,
                    myController: controller.name,
                    valid: (val) {
                      return validInput(val!, 1, 40, "");
                    },
                    isNumber: false,
                  ),
                  CustoemTextFormGeneral(
                    labl: "177".tr + "172".tr,
                    hinText: "178".tr + "172".tr,
                    iconData: Icons.card_travel,
                    myController: controller.nameAr,
                    valid: (val) {
                      return validInput(val!, 1, 40, "");
                    },
                    isNumber: false,
                  ),
                  CustoemTextFormGeneral(
                    labl: "179".tr,
                    hinText: "179".tr,
                    iconData: Icons.card_travel,
                    myController: controller.description,
                    valid: (val) {
                      return validInput(val!, 1, 40, "");
                    },
                    isNumber: false,
                  ),
                  CustoemTextFormGeneral(
                    labl: "179".tr + "172".tr,
                    hinText: "180".tr + "172".tr,
                    iconData: Icons.card_travel,
                    myController: controller.descriptionAr,
                    valid: (val) {
                      return validInput(val!, 1, 40, "");
                    },
                    isNumber: false,
                  ),
                  CustoemTextFormGeneral(
                    labl: "181".tr,
                    hinText: "182".tr,
                    iconData: Icons.card_travel,
                    myController: controller.count,
                    valid: (val) {
                      return validInput(val!, 1, 40, "");
                    },
                    isNumber: true,
                  ),
                  CustoemTextFormGeneral(
                    labl: "76".tr,
                    hinText: "183".tr,
                    iconData: Icons.card_travel,
                    myController: controller.price,
                    valid: (val) {
                      return validInput(val!, 1, 40, "");
                    },
                    isNumber: true,
                  ),
                  CustoemTextFormGeneral(
                    labl: "70".tr,
                    hinText: "184".tr,
                    iconData: Icons.card_travel,
                    myController: controller.discount,
                    valid: (val) {
                      return validInput(val!, 1, 40, "");
                    },
                    isNumber: true,
                  ),
                  CustomDropDownSearch(
                    title: "185".tr,
                    selectedListItem: controller.drobDownSearch,
                    dropDownSelectedName: controller.dropDownName,
                    dropDownSelectedId: controller.dropDownId,
                  ),
                  MaterialButton(
                    height: 40,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    onPressed: () {
                      controller.chooseImage();
                    },
                    child: Text(
                      "173".tr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (controller.file != null)
                    Image.file(
                      controller.file!,
                      height: 50,
                      width: 50,
                    ),
                  CustomButtonAuth(
                      text: "129".tr,
                      onBressed: () {
                        controller.addData();
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
