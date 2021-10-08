
class ResEmpty {
  ResEmpty({
    this.status,
    this.message,
  });

  int? status;
  String? message;

  factory ResEmpty.fromJson(Map<String, dynamic> json) => ResEmpty(
    status: json["status"],
    message: json["message"],
  );

}
