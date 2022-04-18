
class ReqUserUpdatePasswordByNumber {
  ReqUserUpdatePasswordByNumber({
    this.password,
    this.mobileNo,
  });

  String? password;
  String? mobileNo;

  Map<String, dynamic> toJson() => {
    "Password": password,
    "MobileNo": mobileNo?.trim(),
  };
}
