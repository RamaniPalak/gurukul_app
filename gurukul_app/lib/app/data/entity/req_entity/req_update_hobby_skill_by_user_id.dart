
class ReqUpdateHobbySkillByUserId {
  ReqUpdateHobbySkillByUserId({
    required this.memberId,
    required this.updateSkill,
    required this.updateHobby,
  });

  int memberId;
  List<String> updateSkill;
  List<String> updateHobby;

  Map<String, dynamic> toJson() => {
    "MemberID": memberId,
    "update_skill": List<dynamic>.from(updateSkill.map((x) => x)),
    "update_hobby": List<dynamic>.from(updateHobby.map((x) => x)),
  };
}
