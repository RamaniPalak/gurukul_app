
import 'package:dio/dio.dart';
import 'package:gurukul_app/app/data/data_service/server_configs.dart';

class ResGetFamilyMemberByUserId {
  ResGetFamilyMemberByUserId({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  ResGetFamilyMemberByUserIdData? data;

  factory ResGetFamilyMemberByUserId.fromJson(Map<String, dynamic> json) => ResGetFamilyMemberByUserId(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : ResGetFamilyMemberByUserIdData.fromJson(json["data"]),
  );

}

class ResGetFamilyMemberByUserIdData {
  ResGetFamilyMemberByUserIdData({
    this.list,
  });

  List<FamilyMemberModel>? list;

  factory ResGetFamilyMemberByUserIdData.fromJson(Map<String, dynamic> json) => ResGetFamilyMemberByUserIdData(
    list: json["list"] == null ? null : List<FamilyMemberModel>.from(json["list"].map((x) => FamilyMemberModel.fromJson(x))),
  );

}

class FamilyMemberModel {
  FamilyMemberModel({
    this.memberId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.relationTypeTerm,
    this.mobileNo,
    this.profilePic,
    this.occupationTerm,
    this.relationTypeTitle,
    this.occupationTitle,
    this.memberFamilyID,
  });

  int? memberFamilyID;
  int? memberId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? relationTypeTerm;
  String? mobileNo;
  String? profilePic;
  String? occupationTerm;
  String? relationTypeTitle;
  String? occupationTitle;
  MultipartFile? userImageFile;

  String? get userImage{
    if(profilePic != null){
      return ServerConfigs.imageBaseURL + profilePic!;
    }
  }

  String get fullName {

    String name = '';

    if(firstName != null){
      name += firstName ?? '';
      name += ' ';
    }

    if(middleName != null){
      name += middleName ?? '' + ' ';
      name += ' ';
    }

    if(lastName != null){
      name += lastName ?? '' + ' ';
      name += ' ';
    }

    return name;
  }

  factory FamilyMemberModel.fromJson(Map<String, dynamic> json) => FamilyMemberModel(
    memberId: json["MemberID"] == null ? null : json["MemberID"],
    firstName: json["FirstName"] == null ? null : json["FirstName"],
    middleName: json["MiddleName"] == null ? null : json["MiddleName"],
    lastName: json["LastName"] == null ? null : json["LastName"],
    relationTypeTerm: json["RelationType_Term"] == null ? null : json["RelationType_Term"],
    mobileNo: json["MobileNo"] == null ? null : json["MobileNo"],
    profilePic: json["ProfilePic"] == null ? null : json["ProfilePic"],
    occupationTerm: json["Occupation_Term"] == null ? null : json["Occupation_Term"],
    relationTypeTitle: json["RelationType_Title"] == null ? null : json["RelationType_Title"],
    occupationTitle: json["Occupation_Title"] == null ? null : json["Occupation_Title"],
    memberFamilyID: json["MemberFamilyID"] == null ? null : json["MemberFamilyID"],
  );

  Map<String, dynamic> toJson() => {
    "MemberID": memberId == null ? null : memberId,
    "FirstName": firstName == null ? null : firstName,
    "MiddleName": middleName == null ? null : middleName,
    "LastName": lastName == null ? null : lastName,
    "RelationType_Term": relationTypeTerm == null ? null : relationTypeTerm,
    "MobileNo": mobileNo == null ? null : mobileNo,
    "ProfilePic": userImageFile == null ? null : userImageFile,
    "Occupation_Term": occupationTerm == null ? null : occupationTerm,
    "MemberFamilyID": memberFamilyID == null ? null : memberFamilyID,
  };

  factory FamilyMemberModel.fill(FamilyMemberModel? member) => FamilyMemberModel(
    memberId: member?.memberId,
    firstName: member?.firstName,
    middleName: member?.middleName,
    lastName: member?.lastName,
    relationTypeTerm: member?.relationTypeTerm,
    mobileNo: member?.mobileNo,
    profilePic: member?.profilePic,
    occupationTerm: member?.occupationTerm,
    relationTypeTitle: member?.relationTypeTitle,
    occupationTitle: member?.occupationTitle,
    memberFamilyID: member?.memberFamilyID,
  );

}
