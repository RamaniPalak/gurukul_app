
class ResVerifyOtp {
  ResVerifyOtp({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  ResVerifyOtpData? data;

  factory ResVerifyOtp.fromJson(Map<String, dynamic> json) => ResVerifyOtp(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : ResVerifyOtpData.fromJson(json["data"]),
  );

}

class ResVerifyOtpData {
  ResVerifyOtpData({
    this.isVerified,
  });

  int? isVerified;

  factory ResVerifyOtpData.fromJson(Map<String, dynamic> json) => ResVerifyOtpData(
    isVerified: json["is_verifed"],
  );
}
