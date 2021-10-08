
class ResGetCmsPages {
  ResGetCmsPages({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory ResGetCmsPages.fromJson(Map<String, dynamic> json) => ResGetCmsPages(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

}

class Data {
  Data({
    this.dataDetails,
  });

  String? dataDetails;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    dataDetails: json["data_details"] == null ? null : json["data_details"],
  );

}
