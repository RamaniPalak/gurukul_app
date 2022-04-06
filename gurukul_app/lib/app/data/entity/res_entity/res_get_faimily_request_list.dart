// To parse this JSON data, do
//
//     final resGetFaimilyRequestList = resGetFaimilyRequestListFromJson(jsonString);

import 'dart:convert';

import 'package:gurukul_app/app/data/entity/res_entity/res_get_type_term.dart';

ResGetFaimilyRequestList resGetFaimilyRequestListFromJson(String str) => ResGetFaimilyRequestList.fromJson(json.decode(str));

class ResGetFaimilyRequestList {
  ResGetFaimilyRequestList({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  ResGetFaimilyRequestData? data;

  factory ResGetFaimilyRequestList.fromJson(Map<String, dynamic> json) => ResGetFaimilyRequestList(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : ResGetFaimilyRequestData.fromJson(json["data"]),
  );
}

class ResGetFaimilyRequestData {
  ResGetFaimilyRequestData({
    this.list,
  });

  List<ResGetFaimilyRequesListElement>? list;

  factory ResGetFaimilyRequestData.fromJson(Map<String, dynamic> json) => ResGetFaimilyRequestData(
    list: json["list"] == null ? null : List<ResGetFaimilyRequesListElement>.from(json["list"].map((x) => ResGetFaimilyRequesListElement.fromJson(x))),
  );
}

class ResGetFaimilyRequesListElement {
  ResGetFaimilyRequesListElement({
    this.memberFamilyId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    this.userId,
    this.relationTypeTerm,
    this.status,
  });

  int? memberFamilyId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  int? userId;
  String? relationTypeTerm;
  String? status;
  ResGetTypeTermListElement? selectedRelations;

  factory ResGetFaimilyRequesListElement.fromJson(Map<String, dynamic> json) => ResGetFaimilyRequesListElement(
    memberFamilyId: json["MemberFamilyID"] == null ? null : json["MemberFamilyID"],
    firstName: json["FirstName"] == null ? null : json["FirstName"],
    middleName: json["MiddleName"],
    lastName: json["LastName"],
    email: json["Email"] == null ? null : json["Email"],
    userId: json["UserID"] == null ? null : json["UserID"],
    relationTypeTerm: json["RelationType_Term"] == null ? null : json["RelationType_Term"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "MemberFamilyID": memberFamilyId == null ? null : memberFamilyId,
    "FirstName": firstName == null ? null : firstName,
    "MiddleName": middleName,
    "LastName": lastName,
    "Email": email == null ? null : email,
    "UserID": userId == null ? null : userId,
    "RelationType_Term": relationTypeTerm == null ? null : relationTypeTerm,
    "status": status == null ? null : status,
  };
}
