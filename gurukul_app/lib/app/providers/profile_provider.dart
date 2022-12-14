import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gurukul_app/app/data/entity/req_entity/req_update_hobby_skill_by_user_id.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_empty.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_ge_profession_detail.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_address.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_family_member_byuser_id.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_gurukul_list.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_skill_hobby_by_userId.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_type_term.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_nikol_gurukul.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_sgrs_gurukul.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_user_basic_details.dart';
import 'package:gurukul_app/app/providers/base_notifier.dart';
import 'package:gurukul_app/app/providers/serviceProvider.dart';
import 'package:gurukul_app/app/repository/profile_repository.dart';
import 'package:gurukul_app/app/utils/api_response.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/extensions.dart';
import 'package:gurukul_app/app/utils/messages.dart';
import 'package:gurukul_app/app/utils/user_prefs.dart';
import 'package:provider/provider.dart';

import '../data/entity/req_entity/req_accept_reject_request_faimily.dart';
import '../data/entity/res_entity/res_get_faimily_request_list.dart';

class ProfileProvider {
  Future userBasicDetails() async {}

  Future updateUserBasicDetails({String? path}) async {}

  Future getAddress({required AddressType addressType}) async {}

  Future updateAddress() async {}

  Future getProfessionDetail() async {}

  Future updateProfessionDetail() async {}

  Future addUserGurukul() async {}

  Future getGurukulList({required bool isForAll}) async {}

  Future getSkillHobbyByUserId() async {}

  Future updateHobbySkillByUserId() async {}

  Future getFamilyMemberByUserId() async {}

  Future addFamilyMember({String? path}) async {}

  Future getFaimilyRequestList() async {}

  Future acceptRejectRequestFaimily({required int familyID, required String status, String? term}) async {}

  Future getNikolList() async {}

  Future addNikolGurukul() async {}

  Future getSgrsList() async {}

  Future addSgrsGurukul() async {}
}

class ProfileProviderImpl extends BaseNotifier implements ProfileProvider {

  CancelToken cancelToken = CancelToken();

  get cancelableRequest => cancelToken.cancel();

  late ProfileRepository repo;
  late ServiceProviderImpl service;

  AddressType addressTypeEditing = AddressType.CURRENT;

  List<int> years = [] ;

  ProfileProviderImpl(this.repo, this.service) {
    _userRes = ApiResponse();
    _updatedUserRes = ApiResponse();
    _currentAddressRes = ApiResponse();
    _permanentAddressRes = ApiResponse();
    _updatedAddress = ApiResponse();
    _occupation = ApiResponse();
    _updateOccupation = ApiResponse();
    _updateGurukul = ApiResponse();
    _gurukulLists = ApiResponse();
    _hobbiesAndSkill = ApiResponse();
    _updateHobbiesAndSkill = ApiResponse();
    _familyMembers = ApiResponse();
    _updateFamily = ApiResponse();
    _familyPendingList = ApiResponse();
    _familyReq = ApiResponse();
    _nikolLists = ApiResponse();
    _updateNikolGurukul = ApiResponse();
    _sgrsLists = ApiResponse();
    _updateSgrsGurukul = ApiResponse();

    years = [];

    final currentYear = DateTime.now().year;
    // years.add(currentYear);
    for(int i = 0; i < 100; i++){

      years.add(currentYear-i);
    }

  }

  //Api Obj
  ApiResponse<ResUserBasicDetails>? _userRes;

  ApiResponse<ResUserBasicDetails>? get userRes => _userRes;

  ApiResponse<ResUserBasicDetails>? _updatedUserRes;

  ApiResponse<ResUserBasicDetails>? get updatedUserRes => _updatedUserRes;

  ResUserBasicDetailsData? userData;

  fillUserData({ResUserBasicDetailsData? userData}) {
    this.userData = ResUserBasicDetailsData.fill(user: userData);
  }

  //Address Obj
  ApiResponse<ResGetAddress>? _currentAddressRes;

  ApiResponse<ResGetAddress>? get currentAddressRes => _currentAddressRes;

  ResGetAddressData? currentAddressData;

  ApiResponse<ResGetAddress>? _permanentAddressRes;

  ApiResponse<ResGetAddress>? get permanentAddressRes => _permanentAddressRes;

  ApiResponse<ResEmpty>? _updatedAddress;

  ApiResponse<ResEmpty>? get updatedAddress => _updatedAddress;

  ApiResponse<ResGetFaimilyRequestList>? _familyPendingList;

  ApiResponse<ResGetFaimilyRequestList>? get familyPendingList => _familyPendingList;

  ApiResponse<ResEmpty>? _familyReq;

  ApiResponse<ResEmpty>? get familyReq => _familyReq;

  ResGetAddressData? permanentAddressData;

  ResGetAddressData? editingAddressObject;

  fillAddress({required ResGetAddressData? address}) {
    editingAddressObject = ResGetAddressData.fill(address: address);
  }

  //Profession Obj
  ApiResponse<ResGetProfessionDetail>? _occupation;

  ApiResponse<ResGetProfessionDetail>? get occupation => _occupation;

  ResGetProfessionDetailData occupationData = ResGetProfessionDetailData();

  ApiResponse<ResEmpty>? _updateOccupation;

  ApiResponse<ResEmpty>? get updateOccupation => _updateOccupation;

  //Gurukul Obj

  bool isGurukulUpdating = false;

  GurukulModel gurukulModel = GurukulModel();

  fillGurukulModel({required GurukulModel gurukul}) {
    this.gurukulModel = GurukulModel.fill(gurukul);
  }

  ApiResponse<ResEmpty>? _updateGurukul;

  ApiResponse<ResEmpty>? get updateGurukul => _updateGurukul;

  ApiResponse<ResGetGurukulList>? _gurukulLists;

  ApiResponse<ResGetGurukulList>? get gurukulLists => _gurukulLists;

  //Hobbies Obj
  ApiResponse<ResGetSkillHobbyByUserId>? _hobbiesAndSkill;

  ApiResponse<ResGetSkillHobbyByUserId>? get hobbiesAndSkill =>
      _hobbiesAndSkill;

  ApiResponse<ResEmpty>? _updateHobbiesAndSkill;

  ApiResponse<ResEmpty>? get updateHobbiesAndSkill => _updateHobbiesAndSkill;

  //Family Obj
  ApiResponse<ResGetFamilyMemberByUserId>? _familyMembers;

  ApiResponse<ResGetFamilyMemberByUserId>? get familyMembers => _familyMembers;

  FamilyMemberModel familyMember = FamilyMemberModel();

  finnFamilyMember({required FamilyMemberModel family}) {
    familyMember = FamilyMemberModel.fill(family);
  }

  NikolGurukulData? nikolGurukulData =NikolGurukulData();

 //Nikol
  ApiResponse<ResNikolGurukul>? _nikolLists;

  ApiResponse<ResNikolGurukul>? get nikolLists => _nikolLists;

  ApiResponse<ResEmpty>? _updateNikolGurukul;

  ApiResponse<ResEmpty>? get updateNikolGurukul => _updateNikolGurukul;

  //SGRS
  SgrsGurukulData? sgrsGurukulData = SgrsGurukulData();

  ApiResponse<ResSgrsGurukul>? _sgrsLists;

  ApiResponse<ResSgrsGurukul>? get sgrsLists => _sgrsLists;

  ApiResponse<ResEmpty>? _updateSgrsGurukul;

  ApiResponse<ResEmpty>? get updateSgrsGurukul => _updateSgrsGurukul;


  ApiResponse<ResEmpty>? _updateFamily;

  ApiResponse<ResEmpty>? get updateFamily => _updateFamily;

  bool isFamilyUpdating = false;

  @override
  Future userBasicDetails() async {
    try {
      apiResIsLoading(_userRes!);

      final res = await repo.userBasicDetails(cancelToken: cancelToken);

      if (res.status == 0) {
        apiResIsFailed(_userRes!, res.message ?? '');
      } else if (res.status == 2) {
        apiResIsUnAuthorise(_userRes!, res.message ?? '');
      } else {
        //Success
        // userData = res.data;
        fillUserData(userData: res.data);
        apiResIsSuccess(_userRes!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_userRes!, e);
    }
  }

  @override
  Future updateUserBasicDetails({String? path}) async {
    try {
      if (userData != null) {
        if (userData?.firstName?.trim() == null ||
                userData?.middleName?.trim() == null ||
                userData?.lastName?.trim() == null ||
                userData?.whatsAppNo?.trim() == null ||
                userData?.email?.trim() == null ||
                userData?.birthDay == null ||
                userData?.genderType == null ||
                userData?.bloodGroupTerm == null ||
                userData?.maritalStatusTerm == null ||
                userData!.firstName!.trim().isEmpty ||
                userData!.middleName!.trim().isEmpty ||
                userData!.lastName!.trim().isEmpty ||
                userData!.whatsAppNo!.trim().isEmpty ||
                userData!.email!.trim().isEmpty ||
                userData?.birthDay == null ||
                userData!.genderType! == Gender.NONE ||
                userData!.bloodGroupTerm!.isEmpty ||
                userData!.maritalStatusTerm!.isEmpty
            // NOTE BY KISHAN :- Due to new requirements needed to remove unnecessary API call
            // userData?.religionTerm == null||
            // userData?.castTerm == null||
            // userData?.subCastTerm == null ||
            //     userData!.religionTerm!.isEmpty ||
            // userData!.castTerm!.isEmpty ||
            // userData!.subCastTerm!.isEmpty
            ) {
          throw emptyFieldsMsg;
        }

        if (!userData!.whatsAppNo!.isValidMobile) {
          throw 'Please enter valid whatsapp number.';
        }

        if (!userData!.email!.trim().isValidEmail) {
          throw 'Please enter valid Email Address.';
        }

        apiResIsLoading(_updatedUserRes!);

        final res =
            await repo.updateUserBasicDetails(data: userData!, path: path);

        if (res.status == 0) {
          apiResIsFailed(_updatedUserRes!, res.message ?? '');
        } else if (res.status == 2) {
          apiResIsUnAuthorise(_updatedUserRes!, res.message ?? '');
        } else {
          apiResIsSuccess(_updatedUserRes!, res);
          userBasicDetails();

          final localUser = await UserPrefs.shared.getUser;

          print(_updatedUserRes?.data?.data?.profilePic);

          UserPrefs.shared.setLocalData(user: LocalUser(userID: localUser.userID, fullName: res.data?.fullName ?? '', mobile: localUser.mobile, image: res.data?.profilePic ?? '', token: localUser.token, isLogin: localUser.isLogin, email: res.data?.email ?? ''));


          UserPrefs.shared.setLocalData(
              user: LocalUser(
                  userID: localUser.userID,
                  fullName: res.data?.fullName ?? '',
                  mobile: localUser.mobile,
                  image: res.data?.profilePic ?? '',
                  token: localUser.token,
                  isLogin: localUser.isLogin,
                  email: res.data?.email ?? ''));
        }
      } else {
        throw 'User Data Not Found';
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_updatedUserRes!, e);
    }
  }

  Future<List<ResGetTypeTermListElement>?> getListTerms(
      {required TermCategories term}) async {
    try {
      return await service.getTypeTerms(term: term);
    } catch (e) {
      print(e);
    }
  }

  Future<List<ResGetTypeTermListElement>?> getListSubTerms(
      {required String term}) async {
    try {
      return await service.getSubTerm(term: term);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future getAddress({required AddressType addressType}) async {
    final bool isCurrent = addressType == AddressType.CURRENT;
    addressTypeEditing = addressType;
    try {
      apiResIsLoading(isCurrent ? _currentAddressRes! : _permanentAddressRes!);

      final res = await repo.getAddress(addressType: addressType);

      if (res.status == 0) {
        apiResIsSuccess(
            isCurrent ? _currentAddressRes! : _permanentAddressRes!, res);
      } else if (res.status == 2) {
        apiResIsUnAuthorise(
            isCurrent ? _currentAddressRes! : _permanentAddressRes!,
            res.message ?? '');
      } else {
        //Success
        if (isCurrent) {
          this.currentAddressData = res.data;
        } else {
          this.permanentAddressData = res.data;
        }
        apiResIsSuccess(
            isCurrent ? _currentAddressRes! : _permanentAddressRes!, res);
      }
    } catch (e) {
      apiResIsFailed(
          isCurrent ? _currentAddressRes! : _permanentAddressRes!, e);
    }
  }

  @override
  Future updateAddress() async {
    try {
      if (editingAddressObject == null) {
        throw 'No Address Found';
      }

      if (editingAddressObject?.address1 == null ||
          editingAddressObject?.address2 == null ||
          editingAddressObject?.landMark1 == null ||
          editingAddressObject?.area == null ||
          editingAddressObject?.pinCode == null ||
          editingAddressObject?.phoneNo == null ||
          editingAddressObject?.state == null ||
          editingAddressObject?.city == null ||
          editingAddressObject?.country == null ||
          editingAddressObject!.address1!.trim().isEmpty ||
          editingAddressObject!.address2!.trim().isEmpty ||
          editingAddressObject!.landMark1!.trim().isEmpty ||
          editingAddressObject!.area!.trim().isEmpty ||
          editingAddressObject!.pinCode!.trim().isEmpty ||
          editingAddressObject!.phoneNo!.trim().isEmpty ||
          editingAddressObject!.state!.isEmpty ||
          editingAddressObject!.city!.isEmpty ||
          editingAddressObject!.country!.isEmpty) {
        throw emptyFieldsMsg;
      }

      if (!editingAddressObject!.phoneNo!.isValidMobile) {
        throw 'Please enter valid mobile number.';
      }

      if (editingAddressObject!.pinCode!.length > 6) {
        throw 'Please enter valid pin number.';
      }

      apiResIsLoading(_updatedAddress!);

      editingAddressObject!.addressTypeTerm =
          addressValues.reverse[addressTypeEditing];

      final res = await repo.updateAddress(data: editingAddressObject!);

      if (res.status == 0) {
        apiResIsFailed(_updatedAddress!, res.message ?? '');
      } else if (res.status == 2) {
        apiResIsUnAuthorise(_updatedAddress!, res.message ?? '');
      } else {
        apiResIsSuccess(_updatedAddress!, res);

        getAddress(addressType: addressTypeEditing);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_updatedAddress!, e);
    }
  }

  @override
  Future getProfessionDetail() async {
    try {
      apiResIsLoading(_occupation!);

      final res = await repo.getProfessionDetail();

      if (res.status == 0) {
        apiResIsFailed(_occupation!, res.message ?? '');
      } else if (res.status == 2) {
        apiResIsUnAuthorise(_occupation!, res.message ?? '');
      } else {
        //Success
        apiResIsSuccess(_occupation!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_occupation!, e);
    }
  }

  @override
  Future updateProfessionDetail() async {
    try {
      if (occupationData.occupationTerm == null) {
        throw emptyFieldsMsg;
      } else if (occupationData.occupationTerm == 'job') {
        if (occupationData.jobTypeTerm == null) {
          throw emptyFieldsMsg;
        }
      } else if (occupationData.occupationTerm == 'business') {
        if (occupationData.industryTypeTerm == null) {
          throw emptyFieldsMsg;
        }
      }

      apiResIsLoading(_updateOccupation!);

      final res = await repo.updateProfessionDetail(data: occupationData);

      if (res.status == 0) {
        apiResIsFailed(_updateOccupation!, res.message ?? '');
      } else if (res.status == 2) {
        apiResIsUnAuthorise(_updateOccupation!, res.message ?? '');
      } else {
        //Success
        apiResIsSuccess(_updateOccupation!, res);
        getProfessionDetail();
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_updateOccupation!, e);
    }
  }

  @override
  Future addUserGurukul() async {
    try {

      print(gurukulModel.toJson());

      if (gurukulModel.gurukulId == null ||
          gurukulModel.startYear == null ||
          gurukulModel.endYear == null ||
          gurukulModel.purposeTypeTerm == null) {
        throw emptyFieldsMsg;
      } else {
        if (gurukulModel.purposeTypeTerm == 'paststudent') {
          if (gurukulModel.standardDivisionTerm == null ||
              gurukulModel.admissionStandardTerm == null) {
            throw emptyFieldsMsg;
          }
        }
      }

      if ((gurukulModel.startYear?.microsecondsSinceEpoch ?? 0) >=
          (gurukulModel.endYear?.microsecondsSinceEpoch ?? 0)) {
        throw 'Start date should be higher';
      }
      // if(gurukulModel.activity_term1 == null ||
      //    gurukulModel.activity_term2 == null ){
      //
      //   throw emptyFieldsMsg;
      // }if(gurukulModel.interested_in_term1 == null ||
      //     gurukulModel.interested_in_term1 == null ){
      //
      //   throw emptyFieldsMsg;
      // }
      // if(gurukulModel.social_activity_term == null){
      //   throw emptyFieldsMsg;
      // }
      //
      // if(gurukulModel.social_activity_position?.isEmpty == true){
      //   throw emptyFieldsMsg;
      // }

      apiResIsLoading(_updateGurukul!);

      if (isGurukulUpdating) {
        final res = await repo.updateGurukulForId(data: gurukulModel);

        if (res.status == 0) {
          apiResIsFailed(_updateGurukul!, res.message ?? '');
        } else if (res.status == 2) {
          apiResIsUnAuthorise(_updateGurukul!, res.message ?? '');
        } else {
          //Success
          apiResIsSuccess(_updateGurukul!, res);
          getGurukulList(isForAll: true);
          print("getcool");
        }
      } else {
        final res = await repo.addUserGurukul(data: gurukulModel);

        if (res.status == 0) {
          apiResIsFailed(_updateGurukul!, res.message ?? '');
        } else if (res.status == 2) {
          apiResIsUnAuthorise(_updateGurukul!, res.message ?? '');
        } else {
          //Success
          apiResIsSuccess(_updateGurukul!, res);
          getGurukulList(isForAll: true);
        }
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_updateGurukul!, e);
    }
  }

  @override
  Future getGurukulList({required bool isForAll}) async {
    try {
      apiResIsLoading(_gurukulLists!);

      final res = await repo.getGurukulList(isForAll: isForAll);

      if (res.status == 0) {
        apiResIsFailed(_gurukulLists!, res.message ?? '');
      } else if (res.status == 2) {
        apiResIsUnAuthorise(_gurukulLists!, res.message ?? '');
      } else {
        //Success
        apiResIsSuccess(_gurukulLists!, res);
      }
    } catch (e) {
      apiResIsFailed(_gurukulLists!, e);
    }
  }

  @override
  Future getSkillHobbyByUserId() async {
    try {
      apiResIsLoading(_hobbiesAndSkill!);

      final res = await repo.getSkillHobbyByUserId();

      if (res.status == 0) {
        apiResIsFailed(_hobbiesAndSkill!, res.message ?? '');
      } else if (res.status == 2) {
        apiResIsUnAuthorise(_hobbiesAndSkill!, res.message ?? '');
      } else {
        //Success
        apiResIsSuccess(_hobbiesAndSkill!, res);
      }
    } catch (e) {
      apiResIsFailed(_hobbiesAndSkill!, e);
    }
  }

  @override
  Future updateHobbySkillByUserId() async {
    try {
      apiResIsLoading(_updateHobbiesAndSkill!);

      final user = await UserPrefs.shared.getUser;

      List<String> hobbies = [];
      List<String> skills = [];

      hobbiesAndSkill?.data?.data?.hobby?.forEach((element) {
        if (element.isSelected == 1) {
          hobbies.add(element.code ?? '');
        }
      });

      hobbiesAndSkill?.data?.data?.skill?.forEach((element) {
        if (element.isSelected == 1) {
          skills.add(element.code ?? '');
        }
      });

      final data = ReqUpdateHobbySkillByUserId(
          memberId: user.userID, updateSkill: skills, updateHobby: hobbies);

      final res = await repo.updateHobbySkillByUserId(data: data);

      if (res.status == 0) {
        apiResIsFailed(_updateHobbiesAndSkill!, res.message ?? '');
      } else if (res.status == 2) {
        apiResIsUnAuthorise(_updateHobbiesAndSkill!, res.message ?? '');
      } else {
        //Success
        apiResIsSuccess(_updateHobbiesAndSkill!, res);
        getSkillHobbyByUserId();
      }
    } catch (e) {
      apiResIsFailed(_updateHobbiesAndSkill!, e);
    }
  }

  @override
  Future getFamilyMemberByUserId() async {
    try {
      apiResIsLoading(_familyMembers!);

      final res = await repo.getFamilyMemberByUserId();

      if (res.status == 0) {
        apiResIsFailed(_familyMembers!, res.message ?? '');
      } else if (res.status == 2) {
        apiResIsUnAuthorise(_familyMembers!, res.message ?? '');
      } else {
        //Success
        apiResIsSuccess(_familyMembers!, res);
      }
    } catch (e) {
      apiResIsFailed(_familyMembers!, e);
    }
  }

  @override
  Future addFamilyMember({String? path}) async {
    try {
      print(familyMember.toJson());

      if (familyMember.firstName == null ||
          familyMember.middleName == null ||
          familyMember.lastName == null ||
          familyMember.mobileNo == null ||
          familyMember.relationTypeTerm == null ||
          familyMember.occupationTerm == null ||
          familyMember.firstName!.trim().isEmpty ||
          familyMember.middleName!.trim().isEmpty ||
          familyMember.lastName!.trim().isEmpty ||
          familyMember.mobileNo!.trim().isEmpty ||
          familyMember.relationTypeTerm!.isEmpty ||
          familyMember.occupationTerm!.isEmpty) {
        throw emptyFieldsMsg;
      }

      apiResIsLoading(_updateFamily!);

      if (isFamilyUpdating) {
        final res =
            await repo.updateFamilyMember(family: familyMember, path: path);

        if (res.status == 0) {
          apiResIsFailed(_updateFamily!, res.message ?? '');
        } else if (res.status == 2) {
          apiResIsUnAuthorise(_updateFamily!, res.message ?? '');
        } else {
          apiResIsSuccess(_updateFamily!, res);
          getFamilyMemberByUserId();
        }
      } else {
        final res =
            await repo.addFamilyMember(family: familyMember, path: path);

        if (res.status == 0) {
          apiResIsFailed(_updateFamily!, res.message ?? '');
        } else if (res.status == 2) {
          apiResIsUnAuthorise(_updateFamily!, res.message ?? '');
        } else {
          apiResIsSuccess(_updateFamily!, res);
          getFamilyMemberByUserId();
        }
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_updateFamily!, e);
    }
  }

  @override
  Future getFaimilyRequestList() async {

    try {
      apiResIsLoading(_familyPendingList!);

      final res = await repo.getFaimilyRequestList();

      if (res.status == 0) {

        apiResIsFailed(_familyPendingList!, res.message ?? '');
      } else {
        apiResIsSuccess(_familyPendingList!, res);
      }

    } catch (e) {
      print(e);
      apiResIsFailed(_familyPendingList!, e);
    }

  }

  @override
  Future acceptRejectRequestFaimily({required int familyID, required String status,String? term}) async {

    try {
      apiResIsLoading(_familyReq!);

      final res = await repo.acceptRejectRequestFaimily(req: ReqAcceptRejectRequestFaimily(
        memberFamilyID: familyID,
        status: status,
        relation: term
      ));

      if (res.status == 0) {
        apiResIsFailed(_familyReq!, res.message ?? '');
      } else {
        apiResIsSuccess(_familyReq!, res);
        getFaimilyRequestList();
      }

    } catch (e) {
      print(e);
      apiResIsFailed(_familyReq!, e);
    }
  }

  @override
  Future getNikolList() async {
    try {
      apiResIsLoading(_nikolLists!);

      final res = await repo.getNikolList();

      if (res.status == 0) {
        apiResIsFailed(_nikolLists!, res.message ?? '');
      } else if (res.status == 2) {
        apiResIsUnAuthorise(_nikolLists!, res.message ?? '');
      } else {
        //Success
        apiResIsSuccess(_nikolLists!, res);
        nikolGurukulData = res.data;
      }
    } catch (e) {
      apiResIsFailed(_nikolLists!, e);
    }
  }

  @override
  Future addNikolGurukul() async {
    try{
      apiResIsLoading(_updateNikolGurukul!);

      if(nikolGurukulData?.memberGurukulId == null){

        final res = await repo.addNikolGurukul(nikol: nikolGurukulData!);

        if (res.status == 0) {
          apiResIsFailed(_updateNikolGurukul!, res.message ?? '');
        } else if (res.status == 2) {
          apiResIsUnAuthorise(_updateNikolGurukul!, res.message ?? '');
        } else {
          //Success
         await getNikolList();
          apiResIsSuccess(_updateNikolGurukul!, res);
          print("getaddnikol");
        }

      } else {
        final res = await repo.updateNikol(data: nikolGurukulData!);

        if (res.status == 0) {
          apiResIsFailed(_updateNikolGurukul!, res.message ?? '');
        } else if (res.status == 2) {
          apiResIsUnAuthorise(_updateNikolGurukul!, res.message ?? '');
        } else {
          //Success
          await getNikolList();
          apiResIsSuccess(_updateNikolGurukul!, res);
          print("getupadatenikol");
        }
      }

    } catch(e){
      print(e);
      apiResIsFailed(_updateNikolGurukul!, e.toString());

    }
  }

  @override
  Future getSgrsList() async {
    try{
      apiResIsLoading(_sgrsLists!);

      final res = await repo.getSgrsList();

      if (res.status == 0) {
        apiResIsFailed(_sgrsLists!, res.message ?? '');
      } else if (res.status == 2) {
        apiResIsUnAuthorise(_sgrsLists!, res.message ?? '');
      } else {
        //Success
        apiResIsSuccess(_sgrsLists!, res);
        sgrsGurukulData = res.data;
      }

    } catch(e){
      print(e);
      apiResIsFailed(_sgrsLists!, e.toString());

    }
  }


  @override
  Future addSgrsGurukul() async {
  try{
    if ((sgrsGurukulData?.startYear?.microsecondsSinceEpoch ?? 0) >=
        (sgrsGurukulData?.endYear?.microsecondsSinceEpoch ?? 0)) {
      throw 'End Year should be higher than Start Year';
    }

    apiResIsLoading(_updateSgrsGurukul!);

    if(sgrsGurukulData?.memberGurukulId == null){
      final res = await repo.addSgrsGurukul(data: sgrsGurukulData!);

      if (res.status == 0) {
        apiResIsFailed(_updateSgrsGurukul!, res.message ?? '');
      } else if (res.status == 2) {
        apiResIsUnAuthorise(_updateSgrsGurukul!, res.message ?? '');
      } else {
        //Success
        await getSgrsList();
        apiResIsSuccess(_updateSgrsGurukul!, res);
        print("getaddsgrs");
      }
    } else {
      final res = await repo.updateSgrs(data: sgrsGurukulData!);

      if (res.status == 0) {
        apiResIsFailed(_updateSgrsGurukul!, res.message ?? '');
      } else if (res.status == 2) {
        apiResIsUnAuthorise(_updateSgrsGurukul!, res.message ?? '');
      } else {
        //Success
        await getSgrsList();
        apiResIsSuccess(_updateSgrsGurukul!, res);
        print("getupadatesgrs");
      }
    }

  } catch(e){
    print(e);
    apiResIsFailed(_updateSgrsGurukul!, e.toString());
  }
  }
}
