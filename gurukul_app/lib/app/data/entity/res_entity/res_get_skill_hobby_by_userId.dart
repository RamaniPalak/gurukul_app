
class ResGetSkillHobbyByUserId {
  ResGetSkillHobbyByUserId({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  ResGetSkillHobbyByUserIdData? data;

  factory ResGetSkillHobbyByUserId.fromJson(Map<String, dynamic> json) => ResGetSkillHobbyByUserId(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : ResGetSkillHobbyByUserIdData.fromJson(json["data"]),
  );

}

class ResGetSkillHobbyByUserIdData {
  ResGetSkillHobbyByUserIdData({
    this.hobby,
    this.skill,
  });

  List<Hobby>? hobby;
  List<Hobby>? skill;

  factory ResGetSkillHobbyByUserIdData.fromJson(Map<String, dynamic> json) => ResGetSkillHobbyByUserIdData(
    hobby: json["hobby"] == null ? null : List<Hobby>.from(json["hobby"].map((x) => Hobby.fromJson(x))),
    skill: json["skill"] == null ? null : List<Hobby>.from(json["skill"].map((x) => Hobby.fromJson(x))),
  );
}

class Hobby {
  Hobby({
    this.code,
    this.title,
    this.isSelected,
  });

  String? code;
  String? title;
  int? isSelected;

  factory Hobby.fromJson(Map<String, dynamic> json) => Hobby(
    code: json["code"] == null ? null : json["code"],
    title: json["title"] == null ? null : json["title"],
    isSelected: json["is_selected"] == null ? null : json["is_selected"],
  );
}
