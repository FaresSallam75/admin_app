import 'package:admin_app/controller/coupon/view_controller.dart';
import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/data/datasourse/remote/coupon/coupon_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCouponsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  CouponData couponData = CouponData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController? name;
  TextEditingController? count;
  TextEditingController? discount;

  addCouponsData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map dataCoupon = {
        "name": name!.text,
        "count": count!.text,
        "discount": discount!.text
      };
      var response = await couponData.addCoupon(dataCoupon);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRotes.viewCoupons);
          ViewCouponsController con = Get.find();
          con.getCoupons();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    } else {
      Get.defaultDialog(title: "alert", middleText: "Not Valid Data");
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();

    name = TextEditingController();
    count = TextEditingController();
    discount = TextEditingController();
  }

  @override
  void dispose() {
    formState.currentState!.dispose();
    super.dispose();
  }
}
