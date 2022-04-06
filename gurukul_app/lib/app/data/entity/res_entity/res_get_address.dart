
class ResGetAddress {
  ResGetAddress({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  ResGetAddressData? data;

  factory ResGetAddress.fromJson(Map<String, dynamic> json) => ResGetAddress(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : ResGetAddressData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : data?.toJson(),
  };
}

class ResGetAddressData {
  ResGetAddressData({
    this.addressId,
    this.address1,
    this.address2,
    this.landMark1,
    this.city,
    this.pinCode,
    this.state,
    this.country,
    this.phoneNo,
    this.addressTypeTerm,
    this.associationTypeTerm,
    this.area,
  });

  int? userID;
  int? addressId;
  String? address1;
  String? address2;
  String? landMark1;
  String? city;
  String? pinCode;
  String? state;
  String? country;
  String? phoneNo;
  String? addressTypeTerm;
  String? associationTypeTerm;
  String? area;

  factory ResGetAddressData.fromJson(Map<String, dynamic> json) => ResGetAddressData(
    addressId: json["AddressID"] == null ? null : json["AddressID"],
    address1: json["Address1"] == null ? null : json["Address1"],
    address2: json["Address2"] == null ? null : json["Address2"],
    landMark1: json["LandMark1"] == null ? null : json["LandMark1"],
    city: json["City"] == null ? null : json["City"],
    pinCode: json["PinCode"] == null ? null : json["PinCode"],
    state: json["State"] == null ? null : json["State"],
    country: json["Country"] == null ? null : json["Country"],
    phoneNo: json["PhoneNo"] == null ? null : json["PhoneNo"],
    addressTypeTerm: json["AddressType_Term"] == null ? null : json["AddressType_Term"],
    associationTypeTerm: json["AssociationType_Term"] == null ? null : json["AssociationType_Term"],
    area: json["Area"] == null ? null : json["Area"],
  );

  Map<String, dynamic> toJson() => {
    "AddressID": addressId ?? 0,
    "Address1": address1 == null ? null : address1,
    "Address2": address2 == null ? null : address2,
    "LandMark1": landMark1 == null ? null : landMark1,
    "City": city == null ? null : city,
    "PinCode": pinCode == null ? null : pinCode,
    "State": state == null ? null : state,
    "Country": country == null ? null : country,
    "PhoneNo": phoneNo == null ? null : phoneNo,
    "AddressType_Term": addressTypeTerm == null ? null : addressTypeTerm,
    "AssociationType_Term": associationTypeTerm == null ? null : associationTypeTerm,
    "Area": area == null ? null : area,
    "UserID": userID ?? 0
  };

  factory ResGetAddressData.fill({ResGetAddressData? address}) => ResGetAddressData(
    addressId: address?.addressId,
    address1: address?.address1,
    address2: address?.address2,
    landMark1: address?.landMark1,
    city: address?.city,
    pinCode: address?.pinCode,
    state: address?.state,
    country: address?.country,
    phoneNo: address?.phoneNo,
    addressTypeTerm: address?.addressTypeTerm,
    associationTypeTerm: address?.associationTypeTerm,
    area: address?.area,
  );

}
