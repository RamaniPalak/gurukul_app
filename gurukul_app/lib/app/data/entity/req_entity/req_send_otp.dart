
class ReqSendOtp {
  ReqSendOtp({
    this.mobile,
    this.isForUpdatePassword
  });

  String? mobile;
  int? isForUpdatePassword;

  Map<String, dynamic> toJson() => {
    "mobile": mobile,
    "is_for_update_password" : isForUpdatePassword
  };
}
