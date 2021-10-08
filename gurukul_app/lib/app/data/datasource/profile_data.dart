
import 'package:dio/dio.dart';
import 'package:gurukul_app/app/data/data_service/server_configs.dart';
import 'package:gurukul_app/app/data/data_service/web_service.dart';
import 'package:gurukul_app/app/data/entity/req_entity/req_update_hobby_skill_by_user_id.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_empty.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_ge_profession_detail.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_address.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_family_member_byuser_id.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_gurukul_list.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_skill_hobby_by_userId.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_user_basic_details.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/messages.dart';
import 'package:gurukul_app/app/utils/user_prefs.dart';

abstract class ProfileData{
  Future<ResUserBasicDetails> userBasicDetails({CancelToken? cancelToken});
  Future<ResUserBasicDetails> updateUserBasicDetails({String? path,required ResUserBasicDetailsData data});

  Future<ResGetAddress> getAddress({required AddressType addressType});
  Future<ResEmpty> updateAddress({required ResGetAddressData data});

  Future<ResGetProfessionDetail> getProfessionDetail();
  Future<ResEmpty> updateProfessionDetail({required ResGetProfessionDetailData data});

  Future<ResEmpty> addUserGurukul({required GurukulModel data});
  Future<ResGetGurukulList> getGurukulList({required bool isForAll});
  Future<ResEmpty> updateGurukulForId({required GurukulModel data});

  Future<ResGetSkillHobbyByUserId> getSkillHobbyByUserId();
  Future<ResEmpty> updateHobbySkillByUserId({required ReqUpdateHobbySkillByUserId data});

  Future<ResGetFamilyMemberByUserId> getFamilyMemberByUserId();
  Future<ResEmpty> addFamilyMember({String? path,required FamilyMemberModel family});
  Future<ResEmpty> updateFamilyMember({String? path,required FamilyMemberModel family});

}

class ProfileDataImpl implements ProfileData{
  CancelToken? cancelToken;
  @override
  Future<ResUserBasicDetails> userBasicDetails({CancelToken? cancelToken}) async{

    this.cancelToken = cancelToken;

    final user = await UserPrefs.shared.getUser;

    final res = await WebService.shared.getApiDIO(path: ServerConfigs.userBasicDetails,queryParameters: {
      'UserID' : user.userID
    },cancelToken: cancelToken);

    try {
      return ResUserBasicDetails.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResUserBasicDetails> updateUserBasicDetails({String? path,required ResUserBasicDetailsData data}) async {

    if(path != null){
      data.profileFile = await MultipartFile.fromFile(path);
    }

    final user = await UserPrefs.shared.getUser;

    data.id = user.userID;

    print(path);

    var formData = FormData.fromMap(data.toJson());


    final res = await WebService.shared.postApiDIO(path: ServerConfigs.updateUserBasicDetails, data: formData,cancelToken: cancelToken);

    try {
      return ResUserBasicDetails.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResGetAddress> getAddress({required AddressType addressType}) async{
    final user = await UserPrefs.shared.getUser;

    final res = await WebService.shared.getApiDIO(path: ServerConfigs.getAddress,queryParameters: {
      'UserID' : user.userID,
      'AddressType_Term': addressValues.reverse[addressType]
    },cancelToken: cancelToken);

    try {
      return ResGetAddress.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResEmpty> updateAddress({required ResGetAddressData data}) async{
    final user = await UserPrefs.shared.getUser;
    data.userID = user.userID;

    final res = await WebService.shared.postApiDIO(path: ServerConfigs.updateAddress, data: data.toJson(),cancelToken: cancelToken);

    try {
      return ResEmpty.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResGetProfessionDetail> getProfessionDetail() async{
    final user = await UserPrefs.shared.getUser;

    final res = await WebService.shared.getApiDIO(path: ServerConfigs.getProfessionDetail,queryParameters: {
      'UserID' : user.userID
    },cancelToken: cancelToken);

    try {
      return ResGetProfessionDetail.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResEmpty> updateProfessionDetail({required ResGetProfessionDetailData data}) async {
    final user = await UserPrefs.shared.getUser;
    data.userID = user.userID;

    final res = await WebService.shared.postApiDIO(path: ServerConfigs.updateProfessionDetail, data: data.toJson(),cancelToken: cancelToken);

    try {
      return ResEmpty.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResEmpty> addUserGurukul({required GurukulModel data}) async {

    final user = await UserPrefs.shared.getUser;
    data.memberId = user.userID;

    final res = await WebService.shared.postApiDIO(path: ServerConfigs.addUserGurukul,data: data.toJson(),cancelToken: cancelToken);

    try {
      return ResEmpty.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResGetGurukulList> getGurukulList({required bool isForAll}) async{
    final user = await UserPrefs.shared.getUser;

    final res = await WebService.shared.getApiDIO(path: ServerConfigs.getGurukulList,queryParameters: {
      'isForAll': isForAll ? 1 : 0,
      'MemberID' : user.userID
    },cancelToken: cancelToken);

    try {
      return ResGetGurukulList.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResEmpty> updateGurukulForId({required GurukulModel data}) async {
    final user = await UserPrefs.shared.getUser;
    data.memberId = user.userID;

    final res = await WebService.shared.postApiDIO(path: ServerConfigs.updateGurukulForId,data: data.toJson(),cancelToken: cancelToken);

    try {
      return ResEmpty.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResGetSkillHobbyByUserId> getSkillHobbyByUserId() async{
    final user = await UserPrefs.shared.getUser;

    final res = await WebService.shared.getApiDIO(path: ServerConfigs.getSkillHobbyByUserId,queryParameters: {
      'MemberID' : user.userID
    },cancelToken: cancelToken);

    try {
      return ResGetSkillHobbyByUserId.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResEmpty> updateHobbySkillByUserId({required ReqUpdateHobbySkillByUserId data}) async {

    final res = await WebService.shared.postApiDIO(path: ServerConfigs.updateHobbySkillByUserId,data: data.toJson(),cancelToken: cancelToken);

    try {
      return ResEmpty.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResGetFamilyMemberByUserId> getFamilyMemberByUserId() async{
    final user = await UserPrefs.shared.getUser;
    final res = await WebService.shared.getApiDIO(path: ServerConfigs.getFamilyMemberByUserId,queryParameters: {
      "MemberID" : user.userID
    },cancelToken: cancelToken);

    try {
      return ResGetFamilyMemberByUserId.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResEmpty> addFamilyMember({String? path,required FamilyMemberModel family}) async {
    if(path != null){
      family.userImageFile = await MultipartFile.fromFile(path);
    }

    final user = await UserPrefs.shared.getUser;

    family.memberId = user.userID;

    print(path);

    print(family.toJson());

    var formData = FormData.fromMap(family.toJson());

    final res = await WebService.shared.postApiDIO(path: ServerConfigs.addFamilyMember, data: formData,cancelToken: cancelToken);

    try {
      return ResEmpty.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResEmpty> updateFamilyMember({String? path,required FamilyMemberModel family}) async {
    if(path != null){
      family.userImageFile = await MultipartFile.fromFile(path);
    }

    final user = await UserPrefs.shared.getUser;

    family.memberId = user.userID;

    print(path);

    print(family.toJson());

    var formData = FormData.fromMap(family.toJson());

    final res = await WebService.shared.postApiDIO(path: ServerConfigs.updateFamilyMember, data: formData,cancelToken: cancelToken);

    try {
      return ResEmpty.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }
}