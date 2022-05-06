
class ReqNikolAndSgrsGurukul {
  ReqNikolAndSgrsGurukul({
    this.memberId,
    this.isCurrentGurukul,
  });

  int? memberId;
  int? isCurrentGurukul;

  factory ReqNikolAndSgrsGurukul.fromJson(Map<String, dynamic> json) => ReqNikolAndSgrsGurukul(
    memberId: json["MemberID"] == null ? null : json["MemberID"],
    isCurrentGurukul: json["is_current_gurukul"] == null ? null : json["is_current_gurukul"],
  );

  Map<String, dynamic> toJson() => {
    "MemberID": memberId == null ? null : memberId,
    "is_current_gurukul": isCurrentGurukul == null ? null : isCurrentGurukul,
  };
}
