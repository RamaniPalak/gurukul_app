
import 'package:dio/dio.dart';
import 'package:gurukul_app/app/data/datasource/profile_data.dart';
import 'package:gurukul_app/app/data/entity/req_entity/req_update_hobby_skill_by_user_id.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_empty.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_ge_profession_detail.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_address.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_family_member_byuser_id.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_gurukul_list.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_skill_hobby_by_userId.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_nikol_gurukul.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_sgrs_gurukul.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_user_basic_details.dart';
import 'package:gurukul_app/app/utils/enums.dart';

import '../data/entity/req_entity/req_accept_reject_request_faimily.dart';
import '../data/entity/res_entity/res_get_faimily_request_list.dart';

class ProfileRepository{

  final ProfileDataImpl dataSource;

  ProfileRepository({required this.dataSource});

  Future<ResUserBasicDetails> userBasicDetails({CancelToken? cancelToken}) async{
    return await dataSource.userBasicDetails(cancelToken: cancelToken);
  }

  Future<ResUserBasicDetails> updateUserBasicDetails({String? path,required ResUserBasicDetailsData data}) async {
    return await dataSource.updateUserBasicDetails(path: path,data: data);
  }

  Future<ResGetAddress> getAddress({required AddressType addressType}) async{
    return await dataSource.getAddress(addressType: addressType);
  }

  Future<ResEmpty> updateAddress({required ResGetAddressData data}) async{

    return await dataSource.updateAddress(data: data);
  }

  Future<ResGetProfessionDetail> getProfessionDetail() async{
    return await dataSource.getProfessionDetail();
  }

  Future<ResEmpty> updateProfessionDetail({required ResGetProfessionDetailData data}) async {
    return await dataSource.updateProfessionDetail(data: data);
  }

  Future<ResEmpty> addUserGurukul({required GurukulModel data}) async {
    return await dataSource.addUserGurukul(data: data);
  }

  Future<ResGetGurukulList> getGurukulList({required bool isForAll}) async{
    return await dataSource.getGurukulList(isForAll: isForAll);
  }

  Future<ResEmpty> updateGurukulForId({required GurukulModel data}) async {
    return await dataSource.updateGurukulForId(data: data);
  }

  Future<ResGetSkillHobbyByUserId> getSkillHobbyByUserId() async{
    return await dataSource.getSkillHobbyByUserId();
  }

  Future<ResEmpty> updateHobbySkillByUserId({required ReqUpdateHobbySkillByUserId data}) async {
    return await dataSource.updateHobbySkillByUserId(data: data);
  }

  Future<ResGetFamilyMemberByUserId> getFamilyMemberByUserId() async{
    return await dataSource.getFamilyMemberByUserId();
  }

  Future<ResEmpty> addFamilyMember({String? path,required FamilyMemberModel family}) async {
    return await dataSource.addFamilyMember(family: family,path: path);
  }
  Future<ResEmpty> updateFamilyMember({String? path,required FamilyMemberModel family}) async {
    return await dataSource.updateFamilyMember(family: family,path: path);
  }

  Future<ResGetFaimilyRequestList> getFaimilyRequestList() async{
    return await dataSource.getFaimilyRequestList();
  }

  Future<ResEmpty> acceptRejectRequestFaimily({required ReqAcceptRejectRequestFaimily req}) async{
    return await dataSource.acceptRejectRequestFaimily(req: req);
  }


  Future<ResEmpty> addNikolGurukul({required NikolGurukulData nikol}) async {
    return await dataSource.addNikolGurukul(nikol: nikol);
  }

  Future<ResNikolGurukul> getNikolList() async{
    return await dataSource.getNikolList();
  }

  Future<ResEmpty> updateNikol({required NikolGurukulData data}) async {
    return await dataSource.updateNikol(data: data);
  }

  Future<ResEmpty> addSgrsGurukul({required SgrsGurukulData data}) async {
    return await dataSource.addSgrsGurukul(data: data);
  }

  Future<ResSgrsGurukul> getSgrsList() async{
    return await dataSource.getSgrsList();
  }

  Future<ResEmpty> updateSgrs({required SgrsGurukulData data}) async {
    return await dataSource.updateSgrs(data: data);
  }

}