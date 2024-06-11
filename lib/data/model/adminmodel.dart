
class AdminModel {
  String? adminId;
  String? adminName;
  String? adminPassword;
  String? adminEmail;
  String? adminPhone;
  String? adminVerifycode;
  String? adminApprove;
  String? adminCreate;
  String? adminImage;

  AdminModel(
      {this.adminId,
      this.adminName,
      this.adminPassword,
      this.adminEmail,
      this.adminPhone,
      this.adminVerifycode,
      this.adminApprove,
      this.adminCreate,
      this.adminImage});

  AdminModel.fromJson(Map<String, dynamic> json) {
    adminId = json['admin_id'].toString();
    adminName = json['admin_name'].toString();
    adminPassword = json['admin_password'].toString();
    adminEmail = json['admin_email'].toString();
    adminPhone = json['admin_phone'].toString();
    adminVerifycode = json['admin_verifycode'].toString();
    adminApprove = json['admin_approve'].toString();
    adminCreate = json['admin_create'].toString();
    adminImage = json['admin_image'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admin_id'] = this.adminId;
    data['admin_name'] = this.adminName;
    data['admin_password'] = this.adminPassword;
    data['admin_email'] = this.adminEmail;
    data['admin_phone'] = this.adminPhone;
    data['admin_verifycode'] = this.adminVerifycode;
    data['admin_approve'] = this.adminApprove;
    data['admin_create'] = this.adminCreate;
    data['admin_image'] = this.adminImage;
    return data;
  }
}