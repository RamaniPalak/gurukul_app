enum Status { LOADING, COMPLETED, ERROR, UNAUTHORISED }

//Address
enum AddressType{
  CURRENT, PERMANENT
}

final addressValues = EnumValues({
  "current": AddressType.CURRENT,
  "permanent": AddressType.PERMANENT
});

//Terms
enum TermCategories {
  GenderType_Term,
  Occupation_Term,
  JobType_Term,
  IndustryType_Term,
  BloodGroup_Term,
  Religion_Term,
  MaritalStatus_Term,
  Category_Term,
  Cast_Term,
  SubCast_Term,
  CurrentStatus_Term,
  AddressType_Term,
  TrustName_Term,
  SaintType_Term,
  PurposeType_Term,
  AdmissionStandard_Term,
  StandardDivision_Term,
  Role_Term,
  UserType_Term,
  SevaType_Term,
  RelationType_Term,
  InterestedServices_Term,
  GurukulActivities_Term,
  AssociationType_Term,
  Status_Term,
  BHOJANSAMITI,
  BETHAK,
  STAGE,
  OFFICESEVA,
  OTHERS,
  activity_term
}

final typeTermValues = EnumValues({
  "GenderType_Term": TermCategories.GenderType_Term,
  "Occupation_Term": TermCategories.Occupation_Term,
  "JobType_Term": TermCategories.JobType_Term,
  "IndustryType_Term": TermCategories.IndustryType_Term,
  "BloodGroup_Term": TermCategories.BloodGroup_Term,
  "Religion_Term": TermCategories.Religion_Term,
  "MaritalStatus_Term": TermCategories.MaritalStatus_Term,
  "Category_Term": TermCategories.Category_Term,
  "Cast_Term": TermCategories.Cast_Term,
  "SubCast_Term": TermCategories.SubCast_Term,
  "CurrentStatus_Term": TermCategories.CurrentStatus_Term,
  "AddressType_Term": TermCategories.AddressType_Term,
  "TrustName_Term": TermCategories.TrustName_Term,
  "SaintType_Term": TermCategories.SaintType_Term,
  "PurposeType_Term": TermCategories.PurposeType_Term,
  "AdmissionStandard_Term": TermCategories.AdmissionStandard_Term,
  "StandardDivision_Term": TermCategories.StandardDivision_Term,
  "Role_Term": TermCategories.Role_Term,
  "UserType_Term": TermCategories.UserType_Term,
  "SevaType_Term": TermCategories.SevaType_Term,
  "RelationType_Term": TermCategories.RelationType_Term,
  "InterestedServices_Term": TermCategories.InterestedServices_Term,
  "GurukulActivities_Term": TermCategories.GurukulActivities_Term,
  "AssociationType_Term": TermCategories.AssociationType_Term,
  "Status_Term": TermCategories.Status_Term,
  "bhojansamiti" :TermCategories.BHOJANSAMITI,
  "bethak" : TermCategories.BETHAK,
  "stage": TermCategories.STAGE,
  "officeseva": TermCategories.OFFICESEVA,
  "others": TermCategories.OTHERS,
  "activity_term": TermCategories.activity_term
});

//Gender Setup
enum Gender { OTHERS, FEMALE, MALE, NONE }

final genderValues = EnumValues({
  "female": Gender.FEMALE,
  "male": Gender.MALE,
  "other": Gender.OTHERS,
  "none": Gender.NONE
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => new MapEntry(v, k));
    return reverseMap;
  }
}
