
class ReqUserSignUp {
  ReqUserSignUp({
    this.userName,
    this.password,
    this.mobileNo,
    this.email,
  });

  String? userName;
  String? password;
  String? mobileNo;
  String? email;

  Map<String, dynamic> toJson() => {
    "UserName": userName,
    "Password": password,
    "MobileNo": mobileNo,
    "Email": email,
  };
}
