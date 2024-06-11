import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/linkapi.dart';

class CouponData {
  Crud crud;
  CouponData(this.crud);

  viewCoupon() async {
    var response = await crud.postData(AppLink.viewCoupons, {});
    return response.fold((l) => l, (r) => r);
  }

  addCoupon(Map data) async {
    var response = await crud.postData(AppLink.addCoupons, data );
    return response.fold((l) => l, (r) => r);
  }
}
