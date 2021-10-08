
class ResGetSaints {
  ResGetSaints({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  ResGetSaintsData? data;

  factory ResGetSaints.fromJson(Map<String, dynamic> json) => ResGetSaints(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : ResGetSaintsData.fromJson(json["data"]),
  );

}

class ResGetSaintsData {
  ResGetSaintsData({
    this.list,
  });

  List<ResGetSaintsList>? list;

  factory ResGetSaintsData.fromJson(Map<String, dynamic> json) => ResGetSaintsData(
    list: json["list"] == null ? null : List<ResGetSaintsList>.from(json["list"].map((x) => ResGetSaintsList.fromJson(x))),
  );
}

class ResGetSaintsList {
  ResGetSaintsList({
    this.saintId,
    this.saintName,
  });

  int? saintId;
  String? saintName;

  factory ResGetSaintsList.fromJson(Map<String, dynamic> json) => ResGetSaintsList(
    saintId: json["SaintID"] == null ? null : json["SaintID"],
    saintName: json["SaintName"] == null ? null : json["SaintName"],
  );

}
