import 'package:gurukul_app/app/data/entity/res_entity/res_get_all_gurukul_list.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_cms_pages.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_saints.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_type_term.dart';
import 'package:gurukul_app/app/providers/base_notifier.dart';
import 'package:gurukul_app/app/repository/service_repository.dart';
import 'package:gurukul_app/app/screens/helper_screens/cms_screen.dart';
import 'package:gurukul_app/app/utils/api_response.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/user_prefs.dart';

abstract class ServiceProvider {
  Future<LocalUser> getUserFromLocal();

  Future<List<ResGetTypeTermListElement>?> getTypeTerms({required TermCategories term});

  Future<List<ResGetTypeTermListElement>?> getSubTerm({required String term});

  Future<List<ResGetAllGurukulsList>?> getAllGurukulList() async {}

  Future<List<ResGetSaintsList>?> getAllSaintList() async {}

  Future getCmsPages({required CMSType type}) async{
  }
}

class ServiceProviderImpl extends BaseNotifier implements ServiceProvider {
  late ServiceRepository repo;

  ApiResponse<ResGetCmsPages>? _cmsRes;

  ApiResponse<ResGetCmsPages>? get cmsRes => _cmsRes;

  List<ResGetTypeTermListElement>? relations;
  List<ResGetTypeTermListElement>? occupations;
  List<ResGetTypeTermListElement>? bloodGroup;
  List<ResGetTypeTermListElement>? religion;
  List<ResGetTypeTermListElement>? marital;
  List<ResGetTypeTermListElement>? purpose;
  List<ResGetTypeTermListElement>? standard;
  List<ResGetTypeTermListElement>? division;


  ServiceProviderImpl(this.repo) {
    _cmsRes = ApiResponse();
    getUserFromLocal();
  }

  late LocalUser _user;

  @override
  Future<LocalUser> getUserFromLocal() async {
    _user = await UserPrefs.shared.getUser;
    return _user;
  }

  @override
  Future<List<ResGetTypeTermListElement>?> getTypeTerms({required TermCategories term}) async {
    try {

      if(term == TermCategories.RelationType_Term && relations != null){
        return relations;
      }

      if(term == TermCategories.Occupation_Term && occupations != null){
        return occupations;
      }

      if(term == TermCategories.BloodGroup_Term && bloodGroup != null){
        return bloodGroup;
      }

      if(term == TermCategories.Religion_Term && religion != null){
        return religion;
      }

      if(term == TermCategories.MaritalStatus_Term && marital != null){
        return marital;
      }

      if(term == TermCategories.PurposeType_Term && purpose != null){
        return purpose;
      }

      if(term == TermCategories.AdmissionStandard_Term && standard != null){
        return standard;
      }

      if(term == TermCategories.StandardDivision_Term && division != null){
        return division;
      }

      final res = await repo.getTypeTerm(term: term);

      if (res.status == 1) {
        if(term == TermCategories.RelationType_Term){
          relations = res.data?.list;
        }
        if(term == TermCategories.Occupation_Term){
          occupations = res.data?.list;
        }
        if(term == TermCategories.BloodGroup_Term){
          bloodGroup = res.data?.list;
        }
        if(term == TermCategories.Religion_Term){
          religion = res.data?.list;
        }
        if(term == TermCategories.MaritalStatus_Term){
          marital = res.data?.list;
        }
        if(term == TermCategories.PurposeType_Term){
          purpose = res.data?.list;
        }
        if(term == TermCategories.AdmissionStandard_Term){
          standard = res.data?.list;
        }
        if(term == TermCategories.StandardDivision_Term){
          division = res.data?.list;
        }
        return res.data?.list;
      } else {
        throw res.message ?? 'Server Error';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ResGetTypeTermListElement>?> getSubTerm({required String term}) async{
    try {
      final res = await repo.getSubTerm(term: term);

      if (res.status == 1) {
        return res.data?.list;
      } else {
        throw res.message ?? 'Server Error';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ResGetAllGurukulsList>?> getAllGurukulList() async{
    try {
      final res = await repo.getAllGurukulList();

      if (res.status == 1) {
        return res.data?.list;
      } else {
        throw res.message ?? 'Server Error';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ResGetSaintsList>?> getAllSaintList() async{
    try {
      final res = await repo.getAllSaintList();

      if (res.status == 1) {
        return res.data?.list;
      } else {
        throw res.message ?? 'Server Error';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future getCmsPages({required CMSType type}) async{
    try {

      apiResIsLoading(_cmsRes!);

      final res = await repo.getCmsPages(type: type);

      apiResIsSuccess(_cmsRes!, res);

    } catch (e) {
      apiResIsFailed(_cmsRes!, e);
    }
  }
}
