
class ReqVerifyOtp {
  ReqVerifyOtp({
    this.mobile,
    this.otp,
  });

  String? mobile;
  String? otp;

  Map<String, dynamic> toJson() => {
    "mobile": mobile?.trim(),
    "otp": otp,
  };
}
