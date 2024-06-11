class DeliveryModel {
  String? deliveryId;
  String? deliveryName;
  String? deliveryPassword;
  String? deliveryEmail;
  String? deliveryPhone;
  String? deliveryVerifycode;
  String? deliveryApprove;
  String? deliveryCreate;
  String? approve;
  String? deliveryImage;

  DeliveryModel(
      {this.deliveryId,
      this.deliveryName,
      this.deliveryPassword,
      this.deliveryEmail,
      this.deliveryPhone,
      this.deliveryVerifycode,
      this.deliveryApprove,
      this.deliveryCreate,
      this.approve,
      this.deliveryImage});

  DeliveryModel.fromJson(Map<String, dynamic> json) {
    deliveryId = json['delivery_id'].toString();
    deliveryName = json['delivery_name'].toString();
    deliveryPassword = json['delivery_password'].toString();
    deliveryEmail = json['delivery_email'].toString();
    deliveryPhone = json['delivery_phone'].toString();
    deliveryVerifycode = json['delivery_verifycode'].toString();
    deliveryApprove = json['delivery_approve'].toString();
    deliveryCreate = json['delivery_create'].toString();
    approve = json['approve'].toString();
    deliveryImage = json['delivery_image'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivery_id'] = this.deliveryId;
    data['delivery_name'] = this.deliveryName;
    data['delivery_password'] = this.deliveryPassword;
    data['delivery_email'] = this.deliveryEmail;
    data['delivery_phone'] = this.deliveryPhone;
    data['delivery_verifycode'] = this.deliveryVerifycode;
    data['delivery_approve'] = this.deliveryApprove;
    data['delivery_create'] = this.deliveryCreate;
    data['approve'] = this.approve;
    data['delivery_image'] = this.deliveryImage;
    return data;
  }
}
