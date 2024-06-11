import 'package:admin_app/core/class/statusrequest.dart';
import 'package:admin_app/core/constant/rotesname.dart';
import 'package:admin_app/core/function/handlingdata_controller.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/data/datasourse/remote/coupon/coupon_data.dart';
import 'package:admin_app/data/model/couponmodel.dart';
import 'package:get/get.dart';

class ViewCouponsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  CouponData couponData = CouponData(Get.find());
  List<CouponModel> listcouponData = [];

  @override
  void onInit() {
    super.onInit();
    getCoupons();
  }

  getCoupons() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await couponData.viewCoupon();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        listcouponData.clear();
        listcouponData.addAll(responsedata.map((e) => CouponModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToPageAddCoupon() {
    Get.toNamed(AppRotes.addCoupons);
  }
}
