
class ResGetProfessionDetail {
  ResGetProfessionDetail({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  ResGetProfessionDetailData? data;

  factory ResGetProfessionDetail.fromJson(Map<String, dynamic> json) => ResGetProfessionDetail(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : ResGetProfessionDetailData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : data?.toJson(),
  };
}

class ResGetProfessionDetailData {
  ResGetProfessionDetailData({
    this.occupationTerm,
    this.jobTypeTerm,
    this.industryTypeTerm,
    this.occupationTitle,
    this.jobTypeTitle,
    this.industryTitle,
  });

  int? userID;
  String? occupationTerm;
  String? jobTypeTerm;
  String? industryTypeTerm;
  String? occupationTitle;
  String? jobTypeTitle;
  String? industryTitle;

  factory ResGetProfessionDetailData.fromJson(Map<String, dynamic> json) => ResGetProfessionDetailData(
    occupationTerm: json["Occupation_Term"],
    jobTypeTerm: json["JobType_Term"],
    industryTypeTerm: json["IndustryType_Term"],
    occupationTitle: json["Occupation_Title"],
    jobTypeTitle: json["JobType_Title"],
    industryTitle: json["Industry_Title"],
  );

  Map<String, dynamic> toJson() => {
    'UserID':userID,
    "Occupation_Term": occupationTerm,
    "JobType_Term": jobTypeTerm,
    "IndustryType_Term": industryTypeTerm,
  };
}
