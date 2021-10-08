
class ResUserLogin {
  ResUserLogin({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  ResUserLoginData? data;

  factory ResUserLogin.fromJson(Map<String, dynamic> json) => ResUserLogin(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : ResUserLoginData.fromJson(json["data"]),
  );
}

class ResUserLoginData {
  ResUserLoginData({
    this.userId,
    this.userName,
    this.mobileNo,
    this.email,
    this.image,
    this.token,
  });

  int? userId;
  String? userName;
  String? mobileNo;
  String? email;
  String? image;
  String? token;

  factory ResUserLoginData.fromJson(Map<String, dynamic> json) => ResUserLoginData(
    userId: json["UserID"],
    userName: json["UserName"],
    mobileNo: json["MobileNo"],
    email: json["Email"],
    image: json["Image"],
    token: json["Token"],
  );

}
