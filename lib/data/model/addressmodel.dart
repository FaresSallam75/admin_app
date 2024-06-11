
class AddressModel {
  String? addressId;
  String? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  double? addressLatt;
  double? addressLong;

  AddressModel(
      {this.addressId,
      this.addressUsersid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLatt,
      this.addressLong});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'].toString();
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLatt = json['address_latt'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_latt'] = this.addressLatt;
    data['address_long'] = this.addressLong;
    return data;
  }
}