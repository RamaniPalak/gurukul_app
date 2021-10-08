
class ResGetGurukulList {
  ResGetGurukulList({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  ResGetGurukulListData? data;

  factory ResGetGurukulList.fromJson(Map<String, dynamic> json) => ResGetGurukulList(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : ResGetGurukulListData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toJson(),
  };
}

class ResGetGurukulListData {
  ResGetGurukulListData({
    this.list,
  });

  List<GurukulModel>? list;

  factory ResGetGurukulListData.fromJson(Map<String, dynamic> json) => ResGetGurukulListData(
    list: json["list"] == null ? null : List<GurukulModel>.from(json["list"].map((x) => GurukulModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
  };
}

class GurukulModel {
  GurukulModel({
    this.memberGurukulId,
    this.memberId,
    this.gurukulId,
    this.startYear,
    this.endYear,
    this.purposeTypeTerm,
    this.admissionStandardTerm,
    this.standardDivisionTerm,
    this.saintId1,
    this.saintId2,
    this.saint1Name,
    this.saint2Name,
    this.purposeTitle,
    this.admissionStandardTitle,
    this.standardDivisionTitle,
    this.gurukulName,
  });

  int? memberId;
  int? memberGurukulId;
  int? gurukulId;
  DateTime? startYear;
  DateTime? endYear;
  String? purposeTypeTerm;
  String? admissionStandardTerm;
  String? standardDivisionTerm;
  int? saintId1;
  int? saintId2;
  String? saint1Name;
  String? saint2Name;
  String? purposeTitle;
  String? admissionStandardTitle;
  String? standardDivisionTitle;
  String? gurukulName;


  factory GurukulModel.fromJson(Map<String, dynamic> json) => GurukulModel(
    memberGurukulId: json["MemberGurukulID"] == null ? null : json["MemberGurukulID"],
    memberId: json["MemberID"] == null ? null : json["MemberID"],
    gurukulId: json["GurukulID"] == null ? null : json["GurukulID"],
    startYear: json["StartYear"] == null ? null : DateTime.parse(json["StartYear"]),
    endYear: json["EndYear"] == null ? null : DateTime.parse(json["EndYear"]),
    purposeTypeTerm: json["PurposeType_Term"] == null ? null : json["PurposeType_Term"],
    admissionStandardTerm: json["AdmissionStandard_Term"] == null ? null : json["AdmissionStandard_Term"],
    standardDivisionTerm: json["StandardDivision_Term"] == null ? null : json["StandardDivision_Term"],
    saintId1: json["SaintID1"] == null ? null : json["SaintID1"],
    saintId2: json["SaintID2"] == null ? null : json["SaintID2"],
    saint1Name: json["saint_1_name"] == null ? null : json["saint_1_name"],
    saint2Name: json["saint_2_name"] == null ? null : json["saint_2_name"],
    purposeTitle: json["Purpose_Title"] == null ? null : json["Purpose_Title"],
    admissionStandardTitle: json["AdmissionStandard_Title"] == null ? null : json["AdmissionStandard_Title"],
    standardDivisionTitle: json["standard_division_title"] == null ? null : json["standard_division_title"],
    gurukulName: json["GurukulName"] == null ? null : json["GurukulName"],
  );

  Map<String, dynamic> toJson() => {
    "MemberGurukulID": memberGurukulId ?? 0,
    "MemberID": memberId == null ? null : memberId,
    "GurukulID": gurukulId == null ? null : gurukulId,
    "StartYear": startYear == null ? null : startYear?.toIso8601String(),
    "EndYear": endYear == null ? null : endYear?.toIso8601String(),
    "PurposeType_Term": purposeTypeTerm == null ? null : purposeTypeTerm,
    "AdmissionStandard_Term": admissionStandardTerm == null ? null : admissionStandardTerm,
    "StandardDivision_Term": standardDivisionTerm == null ? null : standardDivisionTerm,
    "SaintID1": saintId1 == null ? null : saintId1,
    "SaintID2": saintId2 == null ? null : saintId2,
  };

  factory GurukulModel.fill(GurukulModel? gurukul) => GurukulModel(
    memberGurukulId: gurukul?.memberGurukulId,
    memberId: gurukul?.memberId,
    gurukulId: gurukul?.gurukulId,
    startYear: gurukul?.startYear,
    endYear: gurukul?.endYear,
    purposeTypeTerm: gurukul?.purposeTypeTerm,
    admissionStandardTerm: gurukul?.admissionStandardTerm,
    standardDivisionTerm: gurukul?.standardDivisionTerm,
    saintId1: gurukul?.saintId1,
    saintId2: gurukul?.saintId2,
    saint1Name: gurukul?.saint1Name,
    saint2Name: gurukul?.saint2Name,
    purposeTitle: gurukul?.purposeTitle,
    admissionStandardTitle: gurukul?.admissionStandardTitle,
    standardDivisionTitle: gurukul?.standardDivisionTitle,
    gurukulName: gurukul?.gurukulName,
  );

}
