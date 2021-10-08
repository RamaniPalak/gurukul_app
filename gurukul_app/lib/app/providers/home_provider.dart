
import 'package:gurukul_app/app/data/entity/home_entity.dart';
import 'package:gurukul_app/app/providers/base_notifier.dart';
import 'package:gurukul_app/app/repository/home_repo.dart';
import 'package:gurukul_app/app/utils/api_response.dart';
import 'package:gurukul_app/app/utils/enums.dart';

class HomeProvider extends BaseNotifier{

  HomeRepository repo;

  ApiResponse<Welcome>? _res;

  ApiResponse<Welcome>? get res => _res;

  HomeProvider(this.repo){
    _res = ApiResponse();
    _res!.state = Status.LOADING;
  }

  Future getRes() async {
    try{

      apiResIsLoading(res!);

      final welcome = await repo.getData();

      apiResIsSuccess<Welcome>(res!, welcome);

    }catch (e){
      print(e);
      apiResIsFailed(res! , e);
    }
  }

}