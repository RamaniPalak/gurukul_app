
class ResGetTypeTerm {
  ResGetTypeTerm({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  ResGetTypeTermData? data;

  factory ResGetTypeTerm.fromJson(Map<String, dynamic> json) => ResGetTypeTerm(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : ResGetTypeTermData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toJson(),
  };
}

class ResGetTypeTermData {
  ResGetTypeTermData({
    this.list,
  });

  List<ResGetTypeTermListElement>? list;

  factory ResGetTypeTermData.fromJson(Map<String, dynamic> json) => ResGetTypeTermData(
    list: json["list"] == null ? null : List<ResGetTypeTermListElement>.from(json["list"].map((x) => ResGetTypeTermListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
  };
}

class ResGetTypeTermListElement {
  ResGetTypeTermListElement({
    this.termCode,
    this.termName,
  });

  String? termCode;
  String? termName;

  factory ResGetTypeTermListElement.fromJson(Map<String, dynamic> json) => ResGetTypeTermListElement(
    termCode: json["TermCode"] == null ? null : json["TermCode"],
    termName: json["TermName"] == null ? null : json["TermName"],
  );

  Map<String, dynamic> toJson() => {
    "TermCode": termCode == null ? null : termCode,
    "TermName": termName == null ? null : termName,
  };
}
