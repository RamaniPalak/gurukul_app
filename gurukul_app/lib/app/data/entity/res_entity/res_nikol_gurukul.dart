
class ResNikolGurukul {
  ResNikolGurukul({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  NikolGurukulData? data;

  factory ResNikolGurukul.fromJson(Map<String, dynamic> json) => ResNikolGurukul(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : NikolGurukulData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toJson(),
  };
}

class NikolGurukulData {
  NikolGurukulData({
    this.memberGurukulId,
    this.memberId,
    this.gurukulId,
    this.isJoiningGurukulSeva,
    this.gurukulName,
    this.activityTerm,
    this.isSociety,
    this.organizationName,
    this.societyPosition,
    this.isCurrentGurukul
  });

  int? memberGurukulId;
  int? memberId;
  int? gurukulId;
  int? isJoiningGurukulSeva;
  String? gurukulName;
  String? activityTerm;
  int? isSociety;
  String? organizationName;
  String? societyPosition;
  int? isCurrentGurukul;


  factory NikolGurukulData.fromJson(Map<String, dynamic> json) => NikolGurukulData(
    memberGurukulId: json["MemberGurukulID"] == null ? null : json["MemberGurukulID"],
    memberId: json["MemberID"] == null ? null : json["MemberID"],
    gurukulId: json["GurukulID"] == null ? null : json["GurukulID"],
    isJoiningGurukulSeva: json["is_joining_gurukul_seva"] == null ? null : json["is_joining_gurukul_seva"],
    gurukulName: json["GurukulName"] == null ? null : json["GurukulName"],
    activityTerm: json["activity_term"] == null ? null : json["activity_term"],
    isSociety: json["is_society"],
    organizationName: json["organization_name"],
    societyPosition: json["society_position"],
    isCurrentGurukul: json["is_current_gurukul"] == null ? null : json["is_current_gurukul"],
  );

  Map<String, dynamic> toJson() => {
    "MemberGurukulID": memberGurukulId == null ? null : memberGurukulId,
    "MemberID": memberId == null ? null : memberId,
    "GurukulID": 18,
    "is_joining_gurukul_seva": isJoiningGurukulSeva == null ? null : isJoiningGurukulSeva,
    "GurukulName": gurukulName == null ? null : gurukulName,
    "activity_term": activityTerm == null ? null : activityTerm,
    "is_society": isSociety,
    "organization_name": organizationName?.trim(),
    "society_position": societyPosition?.trim(),
    "is_current_gurukul": 1,
  };

  factory NikolGurukulData.fill(NikolGurukulData? nikolGurukulData) => NikolGurukulData(
    memberId: nikolGurukulData?.memberId,
    gurukulId: nikolGurukulData?.gurukulId,
    isJoiningGurukulSeva: nikolGurukulData?.isJoiningGurukulSeva,
    memberGurukulId: nikolGurukulData?.memberGurukulId,
    activityTerm: nikolGurukulData?.activityTerm,
    gurukulName: nikolGurukulData?.gurukulName,
    isSociety: nikolGurukulData?.isSociety,
    organizationName: nikolGurukulData?.organizationName,
    societyPosition: nikolGurukulData?.societyPosition,
    isCurrentGurukul: 1
  );
}
