class ResSgrsGurukul {
  ResSgrsGurukul({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  SgrsGurukulData? data;

  factory ResSgrsGurukul.fromJson(Map<String, dynamic> json) => ResSgrsGurukul(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : SgrsGurukulData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toJson(),
  };
}

class SgrsGurukulData {
  SgrsGurukulData({
    this.memberId,
    this.gurukulId,
    this.startYear,
    this.endYear,
    this.purposeTypeTerm,
    this.admissionStandardTerm,
    this.standardDivisionTerm,
    this.isCurrentGurukul,
    this.orderNo,
    this.saintId1,
    this.saintId2,
    this.updatedAt,
    this.createdAt,
    this.memberGurukulId,
    this.pastGurukulId
  });

  int? memberId;
  int? gurukulId;
  DateTime? startYear;
  DateTime? endYear;
  String? purposeTypeTerm;
  String? admissionStandardTerm;
  String? standardDivisionTerm;
  int? isCurrentGurukul;
  int? orderNo;
  int? saintId1;
  int? saintId2;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? memberGurukulId;
  int? pastGurukulId;

  factory SgrsGurukulData.fromJson(Map<String, dynamic> json) => SgrsGurukulData(
    memberId: json["MemberID"] == null ? null : json["MemberID"],
    gurukulId: json["GurukulID"] == null ? null : json["GurukulID"],
    startYear: json["StartYear"] == null ? null : DateTime.parse(json["StartYear"]),
    endYear: json["EndYear"] == null ? null : DateTime.parse(json["EndYear"]),
    purposeTypeTerm: json["PurposeType_Term"] == null ? null : json["PurposeType_Term"],
    admissionStandardTerm: json["AdmissionStandard_Term"],
    standardDivisionTerm: json["StandardDivision_Term"],
    isCurrentGurukul: json["is_current_gurukul"] == null ? null : json["is_current_gurukul"],
    orderNo: json["OrderNo"] == null ? null : json["OrderNo"],
    saintId1: json["SaintID1"] == null ? null : json["SaintID1"],
    saintId2: json["SaintID2"] == null ? null : json["SaintID2"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    memberGurukulId: json["MemberGurukulID"] == null ? null : json["MemberGurukulID"],
    pastGurukulId: json["past_gurukul_id"] == null ? null : json["past_gurukul_id"],
  );

  Map<String, dynamic> toJson() => {
    "MemberID": memberId == null ? null : memberId,
    "GurukulID": gurukulId == null ? null : gurukulId,
    "StartYear": startYear == null ? null : startYear?.toIso8601String(),
    "EndYear": endYear == null ? null : endYear?.toIso8601String(),
    "PurposeType_Term": purposeTypeTerm == null ? null : purposeTypeTerm,
    "AdmissionStandard_Term": admissionStandardTerm,
    "StandardDivision_Term": standardDivisionTerm,
    "is_current_gurukul": 0,
    "OrderNo": orderNo == null ? null : orderNo,
    "SaintID1": saintId1 == null ? null : saintId1,
    "SaintID2": saintId2 == null ? null : saintId2,
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "MemberGurukulID": memberGurukulId == null ? null : memberGurukulId,
    "past_gurukul_id": pastGurukulId == null ? null : pastGurukulId,
  };
}
