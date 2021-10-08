

import 'package:gurukul_app/app/data/datasource/service_data.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_all_gurukul_list.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_cms_pages.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_saints.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_type_term.dart';
import 'package:gurukul_app/app/screens/helper_screens/cms_screen.dart';
import 'package:gurukul_app/app/utils/enums.dart';

class ServiceRepository{

  final ServiceDataImpl dataSource;

  ServiceRepository({required this.dataSource});

  Future<ResGetTypeTerm> getTypeTerm({required TermCategories term}) async{
    return dataSource.getTypeTerm(term: term);
  }

  Future<ResGetTypeTerm> getSubTerm({required String term}) async {
    return dataSource.getSubTerm(term: term);
  }

  Future<ResGetAllGurukuls> getAllGurukulList() async {
    return dataSource.getAllGurukulList();
  }

  Future<ResGetSaints> getAllSaintList() async{
    return dataSource.getAllSaintList();
  }

  Future<ResGetCmsPages> getCmsPages({required CMSType type}) async{
    return dataSource.getCmsPages(type: type);
  }

}