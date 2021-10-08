
import 'package:gurukul_app/app/data/data_service/server_configs.dart';
import 'package:gurukul_app/app/data/data_service/web_service.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_all_gurukul_list.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_cms_pages.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_saints.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_type_term.dart';
import 'package:gurukul_app/app/screens/helper_screens/cms_screen.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/messages.dart';

abstract class ServiceData{
  Future<ResGetTypeTerm> getTypeTerm({required TermCategories term});
  Future<ResGetTypeTerm> getSubTerm({required String term});

  Future<ResGetAllGurukuls> getAllGurukulList();
  Future<ResGetSaints> getAllSaintList();

  Future<ResGetCmsPages> getCmsPages({required CMSType type});
}

class ServiceDataImpl implements ServiceData{

  @override
  Future<ResGetTypeTerm> getTypeTerm({required TermCategories term}) async{

    final res = await WebService.shared.getApiDIO(path: ServerConfigs.getTypeTerm,queryParameters: {
      'TermCategoryName' : '${typeTermValues.reverse[term]}'
    });

    try {
      return ResGetTypeTerm.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResGetTypeTerm> getSubTerm({required String term}) async {
    final res = await WebService.shared.getApiDIO(path: ServerConfigs.getSubTerm,queryParameters: {
      'TermCode' : term
    });

    try {
      return ResGetTypeTerm.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResGetAllGurukuls> getAllGurukulList() async {
    final res = await WebService.shared.getApiDIO(path: ServerConfigs.getAllGurukulList);
    try {
      return ResGetAllGurukuls.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResGetSaints> getAllSaintList() async{
    final res = await WebService.shared.getApiDIO(path: ServerConfigs.getSaintId);
    try {
      return ResGetSaints.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResGetCmsPages> getCmsPages({required CMSType type}) async{

    var id = 0;

    switch(type){
      case CMSType.privacyPolicy:
        id = 2;
        break;
      case CMSType.terms:
        id = 1;
        break;
      case CMSType.aboutUs:
        id = 3;
        break;
    }

    final res = await WebService.shared.getApiDIO(path: ServerConfigs.getCmsPages + '/$id');
    try {
      return ResGetCmsPages.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }
}