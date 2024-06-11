import 'package:admin_app/controller/coupon/add_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/function/validinput.dart';
import 'package:admin_app/core/shared/customtestformgeneral.dart';
import 'package:admin_app/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCoupon extends StatelessWidget {
  const AddCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddCouponsController());
    return Scaffold(
      appBar: AppBar(
        title:  Text("194".tr),
      ),
      body: GetBuilder<AddCouponsController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustoemTextFormGeneral(
                    labl: "151".tr,
                    hinText: "195".tr,
                    iconData: Icons.countertops,
                    myController: controller.name!,
                    valid: (val) {
                      return validInput(val!, 1, 40, "");
                    },
                    isNumber: false,
                  ),
                  CustoemTextFormGeneral(
                    labl: "152".tr,
                    hinText: "196".tr,
                    iconData: Icons.numbers,
                    myController: controller.count!,
                    valid: (val) {
                      return validInput(val!, 1, 40, "");
                    },
                    isNumber: false,
                  ),
                  CustoemTextFormGeneral(
                    labl: "134".tr,
                    hinText: "184".tr,
                    iconData: Icons.discount_outlined,
                    myController: controller.discount!,
                    valid: (val) {
                      return validInput(val!, 1, 40, "");
                    },
                    isNumber: false,
                  ),
                  CustomButtonAuth(
                    text: "129".tr,
                    onBressed: () {
                      controller.addCouponsData();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
