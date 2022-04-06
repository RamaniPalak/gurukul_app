
import 'package:dio/dio.dart';
import 'package:gurukul_app/app/data/data_service/server_configs.dart';
import 'package:gurukul_app/app/utils/enums.dart';

class ResUserBasicDetails {
  ResUserBasicDetails({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  ResUserBasicDetailsData? data;

  factory ResUserBasicDetails.fromJson(Map<String, dynamic> json) => ResUserBasicDetails(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : ResUserBasicDetailsData.fromJson(json["data"]),
  );

}

class ResUserBasicDetailsData {
  ResUserBasicDetailsData({
    this.profilePic,
    this.firstName,
    this.middleName,
    this.lastName,
    this.email,
    this.whatsAppNo,
    this.dateOfBirth,
    this.genderTypeTerm,
    this.bloodGroupTerm,
    this.maritalStatusTerm,
    this.castTerm,
    this.subCastTerm,
    this.mobile,
    this.id,
    this.bloodGroupTitle,
    this.castTitle,
    this.genderTitle,
    this.maritalStatusTitle,
    this.religionTitle,
    this.subCastTitle,
    this.religionTerm,
    this.marriageDate
  });

  int? id;
  String? profilePic;
  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  String? mobile;
  String? whatsAppNo;
  String? dateOfBirth;
  String? marriageDate;
  String? genderTypeTerm;
  String? bloodGroupTerm;
  String? maritalStatusTerm;
  String? castTerm;
  String? subCastTerm;
  String? genderTitle;
  String? bloodGroupTitle;
  String? maritalStatusTitle;
  String? castTitle;
  String? subCastTitle;
  String? religionTitle;
  MultipartFile? profileFile;
  String? religionTerm;

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

  Gender? get genderType{
    return genderValues.map[genderTypeTerm ?? ''];
  }

  String? get genderStr{
    return genderValues.reverse[genderType];
  }

  DateTime? get birthDay{
    try{
      return DateTime.parse(dateOfBirth ?? '');
    }catch(e){
      return null;
    }
  }

  DateTime? get marriageDay{
    try{
      return DateTime.parse(marriageDate ?? '');
    }catch(e){
      return null;
    }
  }

  factory ResUserBasicDetailsData.fromJson(Map<String, dynamic> json) => ResUserBasicDetailsData(
    profilePic: json["ProfilePic"] == null ? null : json["ProfilePic"],
    firstName: json["FirstName"] == null ? null : json["FirstName"],
    middleName: json["MiddleName"] == null ? null : json["MiddleName"],
    lastName: json["LastName"] == null ? null : json["LastName"],
    email: json["Email"] == null ? null : json["Email"],
    whatsAppNo: json["WhatsAppNo"] == null ? null : json["WhatsAppNo"],
    dateOfBirth: json["DateOfBirth"] == null ? null : json["DateOfBirth"],
    marriageDate: json["anniversary_date"] == null ? null : json["anniversary_date"],
    genderTypeTerm: json["GenderType_Term"] == null ? null : json["GenderType_Term"],
    bloodGroupTerm: json["BloodGroup_Term"] == null ? null : json["BloodGroup_Term"],
    maritalStatusTerm: json["MaritalStatus_Term"] == null ? null : json["MaritalStatus_Term"],
    castTerm: json["Cast_Term"] == null ? null : json["Cast_Term"],
    subCastTerm: json["SubCast_Term"] == null ? null : json["SubCast_Term"],
    mobile: json["MobileNo"] == null ? null : json["MobileNo"],
    genderTitle: json["Gender_Title"] == null ? null : json["Gender_Title"],
    bloodGroupTitle: json["BloodGroup_Title"] == null ? null : json["BloodGroup_Title"],
    maritalStatusTitle: json["MaritalStatus_Title"] == null ? null : json["MaritalStatus_Title"],
    castTitle: json["Cast_Title"] == null ? null : json["Cast_Title"],
    subCastTitle: json["SubCast_Title"] == null ? null : json["SubCast_Title"],
    religionTitle: json["Religion_Title"] == null ? null : json["Religion_Title"],
    religionTerm: json["Religion_Term"] == null ? null : json["Religion_Term"],
  );

  Map<String, dynamic> toJson() => {
    "UserID":id,
    "ProfilePic": profileFile,
    "FirstName": firstName,
    "MiddleName": middleName,
    "LastName": lastName,
    "Email": email,
    "WhatsAppNo": whatsAppNo,
    "DateOfBirth": dateOfBirth,
    "anniversary_date": marriageDate,
    "GenderType_Term": genderTypeTerm,
    "BloodGroup_Term": bloodGroupTerm,
    "MaritalStatus_Term": maritalStatusTerm,
    "Cast_Term": castTerm,
    "SubCast_Term": subCastTerm,
    "MobileNo": mobile,
    "Religion_Term": religionTerm
  };

  factory ResUserBasicDetailsData.fill({ResUserBasicDetailsData? user}) => ResUserBasicDetailsData(
    profilePic: user?.profilePic,
    firstName: user?.firstName,
    middleName: user?.middleName,
    lastName: user?.lastName,
    email: user?.email,
    whatsAppNo: user?.whatsAppNo,
    dateOfBirth: user?.dateOfBirth,
    marriageDate: user?.marriageDate,
    genderTypeTerm: user?.genderTypeTerm,
    bloodGroupTerm: user?.bloodGroupTerm,
    maritalStatusTerm: user?.maritalStatusTerm,
    castTerm: user?.castTerm,
    subCastTerm: user?.subCastTerm,
    mobile: user?.mobile,
    genderTitle: user?.genderTitle,
    bloodGroupTitle: user?.bloodGroupTitle,
    maritalStatusTitle: user?.maritalStatusTitle,
    castTitle: user?.castTitle,
    subCastTitle: user?.subCastTitle,
    religionTitle: user?.religionTitle,
    religionTerm: user?.religionTerm,
  );

}
