import 'package:admin_app/controller/coupon/view_controller.dart';
import 'package:admin_app/core/class/handlingdataview.dart';
import 'package:admin_app/core/constant/colors.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponPageView extends StatelessWidget {
  const CouponPageView({super.key});

  @override
  Widget build(BuildContext context) {
    ViewCouponsController controller = Get.put(ViewCouponsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("114".tr),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.offNamed(AppRotes.homePage);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.goToPageAddCoupon();
        },
        child: const Icon(Icons.add, color: AppColor.backGround),
      ),
      body: GetBuilder<ViewCouponsController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              ...List.generate(
                controller.listcouponData.length,
                (index) => Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  color: AppColor.thirdColor.withOpacity(0.8),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${"150".tr} :   ${controller.listcouponData[index].couponId}",
                            style: Theme.of(context).textTheme.titleLarge),
                        Text(
                          "${"151".tr} :   ${controller.listcouponData[index].couponName}",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                            "${"152".tr} :   ${controller.listcouponData[index].couponCount}",
                            style: Theme.of(context).textTheme.titleLarge),
                        Text(
                            "${"134".tr} :   ${controller.listcouponData[index].couponDiscount} %",
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
