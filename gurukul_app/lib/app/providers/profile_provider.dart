import 'package:dio/dio.dart';
import 'package:gurukul_app/app/data/entity/req_entity/req_update_hobby_skill_by_user_id.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_empty.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_ge_profession_detail.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_address.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_family_member_byuser_id.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_gurukul_list.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_skill_hobby_by_userId.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_type_term.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_user_basic_details.dart';
import 'package:gurukul_app/app/providers/base_notifier.dart';
import 'package:gurukul_app/app/providers/serviceProvider.dart';
import 'package:gurukul_app/app/repository/profile_repository.dart';
import 'package:gurukul_app/app/utils/api_response.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/extensions.dart';
import 'package:gurukul_app/app/utils/messages.dart';
import 'package:gurukul_app/app/utils/user_prefs.dart';

class ProfileProvider {
  Future userBasicDetails() async {}
  Future updateUserBasicDetails({String? path}) async {}

  Future getAddress({required AddressType addressType}) async {}
  Future updateAddress() async {}

  Future getProfessionDetail() async {}
  Future updateProfessionDetail() async {}

  Future addUserGurukul() async {}
  Future getGurukulList({required bool isForAll}) async {}

  Future getSkillHobbyByUserId() async{}
  Future updateHobbySkillByUserId() async {}

  Future getFamilyMemberByUserId() async{}
  Future addFamilyMember({String? path}) async {}
}


class ProfileProviderImpl extends BaseNotifier implements ProfileProvider {

  CancelToken cancelToken = CancelToken();
  get cancelableRequest => cancelToken.cancel();

  late ProfileRepository repo;
  late ServiceProviderImpl service;

  AddressType addressTypeEditing = AddressType.CURRENT;

  ProfileProviderImpl(this.repo,this.service){
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
  }

  //Api Obj
  ApiResponse<ResUserBasicDetails>? _userRes;

  ApiResponse<ResUserBasicDetails>? get userRes => _userRes;

  ApiResponse<ResUserBasicDetails>? _updatedUserRes;

  ApiResponse<ResUserBasicDetails>? get updatedUserRes => _updatedUserRes;

  ResUserBasicDetailsData? userData;

  fillUserData({ResUserBasicDetailsData? userData}){
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

  ResGetAddressData? permanentAddressData;

  ResGetAddressData? editingAddressObject;

  fillAddress({required ResGetAddressData? address}){
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

  ApiResponse<ResGetSkillHobbyByUserId>? get hobbiesAndSkill => _hobbiesAndSkill;

  ApiResponse<ResEmpty>? _updateHobbiesAndSkill;

  ApiResponse<ResEmpty>? get updateHobbiesAndSkill => _updateHobbiesAndSkill;

  //Family Obj
  ApiResponse<ResGetFamilyMemberByUserId>? _familyMembers;

  ApiResponse<ResGetFamilyMemberByUserId>? get familyMembers => _familyMembers;

  FamilyMemberModel familyMember = FamilyMemberModel();

  finnFamilyMember({required FamilyMemberModel family}){
    familyMember = FamilyMemberModel.fill(family);
  }

  ApiResponse<ResEmpty>? _updateFamily;

  ApiResponse<ResEmpty>? get updateFamily => _updateFamily;

  bool isFamilyUpdating = false;


  @override
  Future userBasicDetails() async {

    try{
      apiResIsLoading(_userRes!);

      final res = await repo.userBasicDetails(cancelToken: cancelToken);

      if(res.status == 0){
        apiResIsFailed(_userRes!, res.message ?? '');
      }else if(res.status == 2){
        apiResIsUnAuthorise(_userRes!, res.message ?? '');
      }else{
        //Success
        // userData = res.data;
        fillUserData(userData: res.data);
        apiResIsSuccess(_userRes!, res);
      }

    }catch(e){
      print(e);
      apiResIsFailed(_userRes!, e);
    }

  }

  @override
  Future updateUserBasicDetails({String? path}) async {
    try{

      if(userData != null){
        if (
            userData?.firstName == null||
            userData?.middleName == null||
            userData?.lastName == null||
            userData?.whatsAppNo == null||
            userData?.email == null||
            userData?.birthDay == null||
            userData?.genderType == null||
            userData?.bloodGroupTerm == null||
            userData?.religionTerm == null||
            userData?.maritalStatusTerm == null||
            userData?.castTerm == null||
            userData?.subCastTerm == null ||
            userData!.firstName!.isEmpty ||
            userData!.middleName!.isEmpty ||
            userData!.lastName!.isEmpty ||
            userData!.whatsAppNo!.isEmpty ||
            userData!.email!.isEmpty ||
            userData?.birthDay == null ||
            userData!.genderType! == Gender.NONE ||
            userData!.bloodGroupTerm!.isEmpty ||
            userData!.religionTerm!.isEmpty ||
            userData!.maritalStatusTerm!.isEmpty ||
            userData!.castTerm!.isEmpty ||
            userData!.subCastTerm!.isEmpty
        ) {
          throw emptyFieldsMsg;
        }

        if(!userData!.whatsAppNo!.isValidMobile){
          throw 'Please enter valid whatsapp number.';
        }

        if(!userData!.email!.isValidEmail){
          throw 'Please enter valid Email Address.';
        }

        apiResIsLoading(_updatedUserRes!);

        final res = await repo.updateUserBasicDetails(data: userData!,path: path);

        if(res.status == 0){
          apiResIsFailed(_updatedUserRes!, res.message ?? '');
        }else if(res.status == 2){
          apiResIsUnAuthorise(_updatedUserRes!, res.message ?? '');
        }else{
          apiResIsSuccess(_updatedUserRes!, res);
          userBasicDetails();

          final localUser = await UserPrefs.shared.getUser;

          print(_updatedUserRes?.data?.data?.profilePic);

          UserPrefs.shared.setLocalData(user: LocalUser(userID: localUser.userID, fullName: res.data?.fullName ?? '', mobile: localUser.mobile, image: res.data?.profilePic ?? '', token: localUser.token, isLogin: localUser.isLogin, email: res.data?.email ?? ''));

        }

      }else{
        throw 'User Data Not Found';
      }

    }catch(e){
      print(e);
      apiResIsFailed(_updatedUserRes!, e);
    }
  }

  Future<List<ResGetTypeTermListElement>?> getListTerms({required TermCategories term}) async {
    try {
      return await service.getTypeTerms(term: term);
    } catch (e) {
      print(e);
    }
  }

  Future<List<ResGetTypeTermListElement>?> getListSubTerms({required String term}) async {
    try {
      return await service.getSubTerm(term: term);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future getAddress({required AddressType addressType}) async{
    final bool isCurrent = addressType == AddressType.CURRENT;
    addressTypeEditing = addressType;
    try {

      apiResIsLoading(isCurrent ? _currentAddressRes! : _permanentAddressRes!);

      final res = await repo.getAddress(addressType: addressType);

      if(res.status == 0){
        apiResIsSuccess(isCurrent ? _currentAddressRes! : _permanentAddressRes!, res);
      }else if(res.status == 2){
        apiResIsUnAuthorise(isCurrent ? _currentAddressRes! : _permanentAddressRes!, res.message ?? '');
      }else{
        //Success
        if(isCurrent){
          this.currentAddressData = res.data;
        }else{
          this.permanentAddressData = res.data;
        }
        apiResIsSuccess(isCurrent ? _currentAddressRes! : _permanentAddressRes!, res);
      }
    } catch (e) {
      apiResIsFailed(isCurrent ? _currentAddressRes! : _permanentAddressRes!, e);
    }

  }

  @override
  Future updateAddress() async {
    try {

      if(editingAddressObject == null){
        throw 'No Address Found';
      }


      if (editingAddressObject?.address1 == null ||
          editingAddressObject?.address2 == null ||
          editingAddressObject?.landMark1 == null ||
          editingAddressObject?.landMark2 == null ||
          editingAddressObject?.pinCode == null ||
          editingAddressObject?.phoneNo == null ||
          editingAddressObject?.state == null ||
          editingAddressObject?.city == null ||
          editingAddressObject?.country == null ||

          editingAddressObject!.address1!.isEmpty ||
          editingAddressObject!.address2!.isEmpty ||
          editingAddressObject!.landMark1!.isEmpty ||
          editingAddressObject!.landMark2!.isEmpty ||
          editingAddressObject!.pinCode!.isEmpty ||
          editingAddressObject!.phoneNo!.isEmpty ||
          editingAddressObject!.state!.isEmpty ||
          editingAddressObject!.city!.isEmpty ||
          editingAddressObject!.country!.isEmpty) {
        throw emptyFieldsMsg;
      }

      if(!editingAddressObject!.phoneNo!.isValidMobile){
        throw 'Please enter valid mobile number.';
      }

      if(editingAddressObject!.pinCode!.length > 6){
        throw 'Please enter valid pin number.';
      }

      apiResIsLoading(_updatedAddress!);

      editingAddressObject!.addressTypeTerm = addressValues.reverse[addressTypeEditing];

      final res = await repo.updateAddress(data: editingAddressObject!);

      if(res.status == 0){
        apiResIsFailed(_updatedAddress!, res.message ?? '');
      }else if(res.status == 2){
        apiResIsUnAuthorise(_updatedAddress!, res.message ?? '');
      }else{
        apiResIsSuccess(_updatedAddress!, res);

        getAddress(addressType: addressTypeEditing);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_updatedAddress!, e);
    }

  }

  @override
  Future getProfessionDetail() async{
    try{
      apiResIsLoading(_occupation!);

      final res = await repo.getProfessionDetail();

      if(res.status == 0){
        apiResIsFailed(_occupation!, res.message ?? '');
      }else if(res.status == 2){
        apiResIsUnAuthorise(_occupation!, res.message ?? '');
      }else{
        //Success
        apiResIsSuccess(_occupation!, res);
      }
    }catch(e){
      print(e);
      apiResIsFailed(_occupation!, e);
    }
  }

  @override
  Future updateProfessionDetail() async {
    try{

      if (occupationData.occupationTerm == null) {
        throw emptyFieldsMsg;
      }else if (occupationData.occupationTerm == 'job'){
        if (occupationData.jobTypeTerm == null) {
          throw emptyFieldsMsg;
        }
      }else if (occupationData.occupationTerm == 'business'){
        if (occupationData.industryTypeTerm == null) {
          throw emptyFieldsMsg;
        }
      }

      apiResIsLoading(_updateOccupation!);

      final res = await repo.updateProfessionDetail(data: occupationData);

      if(res.status == 0){
        apiResIsFailed(_updateOccupation!, res.message ?? '');
      }else if(res.status == 2){
        apiResIsUnAuthorise(_updateOccupation!, res.message ?? '');
      }else{
        //Success
        apiResIsSuccess(_updateOccupation!, res);
        getProfessionDetail();
      }
    }catch(e){
      print(e);
      apiResIsFailed(_updateOccupation!, e);
    }
  }

  @override
  Future addUserGurukul() async {

    try {

      if(gurukulModel.gurukulId == null || gurukulModel.startYear == null || gurukulModel.endYear == null || gurukulModel.purposeTypeTerm == null) {
        throw emptyFieldsMsg;
      }else{
        if(gurukulModel.purposeTypeTerm == 'education'){
          if(gurukulModel.standardDivisionTerm == null || gurukulModel.admissionStandardTerm == null){
            throw emptyFieldsMsg;
          }
        }
      }

      if((gurukulModel.startYear?.microsecondsSinceEpoch ?? 0) >= (gurukulModel.endYear?.microsecondsSinceEpoch ?? 0)){
        throw 'Start date should be higher';
      }



      apiResIsLoading(_updateGurukul!);

      if(isGurukulUpdating){

        final res = await repo.updateGurukulForId(data: gurukulModel);

        if(res.status == 0){
          apiResIsFailed(_updateGurukul!, res.message ?? '');
        } else if (res.status == 2) {
          apiResIsUnAuthorise(_updateGurukul!, res.message ?? '');
        } else {
          //Success
          apiResIsSuccess(_updateGurukul!, res);
          getGurukulList(isForAll: true);
        }
      }else{

        final res = await repo.addUserGurukul(data: gurukulModel);

        if(res.status == 0){
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
  Future getSkillHobbyByUserId() async{
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
  Future updateHobbySkillByUserId() async{
    try {
      apiResIsLoading(_updateHobbiesAndSkill!);

      final user = await UserPrefs.shared.getUser;

      List<String> hobbies = [];
      List<String> skills = [];

      hobbiesAndSkill?.data?.data?.hobby?.forEach((element) {
        if(element.isSelected == 1){hobbies.add(element.code ?? '');}

      });

      hobbiesAndSkill?.data?.data?.skill?.forEach((element) {
        if(element.isSelected == 1){skills.add(element.code ?? '');}
      });

      final data = ReqUpdateHobbySkillByUserId(memberId: user.userID, updateSkill: skills, updateHobby: hobbies);

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
  Future addFamilyMember({String? path}) async{
    try {
      print(familyMember.toJson());

      if (
          familyMember.firstName == null ||
          familyMember.middleName == null ||
          familyMember.lastName == null ||
          familyMember.mobileNo == null ||
          familyMember.relationTypeTerm == null ||
          familyMember.occupationTerm == null ||
          familyMember.firstName!.isEmpty ||
          familyMember.middleName!.isEmpty ||
          familyMember.lastName!.isEmpty ||
          familyMember.mobileNo!.isEmpty ||
          familyMember.relationTypeTerm!.isEmpty ||
          familyMember.occupationTerm!.isEmpty
      ) {
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
}