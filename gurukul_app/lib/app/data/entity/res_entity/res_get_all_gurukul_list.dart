
class ResGetAllGurukuls {
  ResGetAllGurukuls({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  ResGetAllGurukulsData? data;

  factory ResGetAllGurukuls.fromJson(Map<String, dynamic> json) => ResGetAllGurukuls(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : ResGetAllGurukulsData.fromJson(json["data"]),
  );

}

class ResGetAllGurukulsData {
  ResGetAllGurukulsData({
    this.list,
  });

  List<ResGetAllGurukulsList>? list;

  factory ResGetAllGurukulsData.fromJson(Map<String, dynamic> json) => ResGetAllGurukulsData(
    list: json["list"] == null ? null : List<ResGetAllGurukulsList>.from(json["list"].map((x) => ResGetAllGurukulsList.fromJson(x))),
  );

}

class ResGetAllGurukulsList {
  ResGetAllGurukulsList({
    this.gurukulId,
    this.gurukulName,
  });

  int? gurukulId;
  String? gurukulName;

  factory ResGetAllGurukulsList.fromJson(Map<String, dynamic> json) => ResGetAllGurukulsList(
    gurukulId: json["GurukulID"] == null ? null : json["GurukulID"],
    gurukulName: json["GurukulName"] == null ? null : json["GurukulName"],
  );

}
