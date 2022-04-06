class ReqAcceptRejectRequestFaimily {

  ReqAcceptRejectRequestFaimily({
    this.memberFamilyID,
    this.status,
    this.memberID,
    this.relation,
  });

  int? memberFamilyID;
  String? status;
  int? memberID;
  String? relation;

  Map<String, dynamic> toJson() => {
    "MemberFamilyID": memberFamilyID,
    "status" : status,
    "MemberID" : memberID,
    "RelationType_Term" : relation,
  };
}
