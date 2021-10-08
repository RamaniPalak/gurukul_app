
class ResGetCurrentVersion {
  ResGetCurrentVersion({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory ResGetCurrentVersion.fromJson(Map<String, dynamic>? json) => ResGetCurrentVersion(
    status: json?["status"] == null ? null : json?["status"],
    message: json?["message"] == null ? null : json?["message"],
    data: json?["data"] == null ? null : Data.fromJson(json?["data"]),
  );

}

class Data {
  Data({
    this.androidAppVersion,
    this.iosAppVersion,
    this.isUnderMaintenance,
    this.isForceUpdateIos,
    this.isForceUpdateAndroid,
  });

  String? androidAppVersion;
  String? iosAppVersion;
  int? isUnderMaintenance;
  int? isForceUpdateIos;
  int? isForceUpdateAndroid;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    androidAppVersion: json["android_app_version"] == null ? null : json["android_app_version"],
    iosAppVersion: json["ios_app_version"] == null ? null : json["ios_app_version"],
    isUnderMaintenance: json["is_undermaintenance"] == null ? null : json["is_undermaintenance"],
    isForceUpdateIos: json["is_force_update_ios"] == null ? null : json["is_force_update_ios"],
    isForceUpdateAndroid: json["is_force_update_android"] == null ? null : json["is_force_update_android"],
  );
}
