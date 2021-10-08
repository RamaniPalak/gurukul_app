
class ResSendOtp {
  ResSendOtp({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  ResSendOtpData? data;

  factory ResSendOtp.fromJson(Map<String, dynamic> json) => ResSendOtp(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : ResSendOtpData.fromJson(json["data"]),
  );
}

class ResSendOtpData {
  ResSendOtpData({
    this.mobile,
    this.otp,
  });

  String? mobile;
  int? otp;


  factory ResSendOtpData.fromJson(Map<String, dynamic> json) => ResSendOtpData(
    mobile: json["mobile"],
    otp: json["otp"]
  );
}
