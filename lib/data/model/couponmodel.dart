class CouponModel {
  String? couponId;
  String? couponName;
  String? couponCount;
  String? couponDiscount;
  String? couponExpireddate;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponDiscount,
      this.couponExpireddate});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'].toString();
    couponName = json['coupon_name'].toString();
    couponCount = json['coupon_count'].toString();
    couponDiscount = json['coupon_discount'].toString();
    couponExpireddate = json['coupon_expireddate'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = this.couponId;
    data['coupon_name'] = this.couponName;
    data['coupon_count'] = this.couponCount;
    data['coupon_discount'] = this.couponDiscount;
    data['coupon_expireddate'] = this.couponExpireddate;
    return data;
  }
}