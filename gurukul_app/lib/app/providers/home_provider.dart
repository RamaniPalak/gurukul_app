
import 'package:gurukul_app/app/data/entity/home_entity.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_gurukul_post.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_post_details.dart';
import 'package:gurukul_app/app/providers/base_notifier.dart';
import 'package:gurukul_app/app/repository/home_repo.dart';
import 'package:gurukul_app/app/utils/api_response.dart';
import 'package:gurukul_app/app/utils/enums.dart';

class HomeProvider {

  Future getGurukulPost() async {}

  Future getGurukulPostDetails({int? id}) async {}

}


class HomeProviderImpl extends BaseNotifier implements HomeProvider{

  HomeRepository repo;

  ApiResponse<ResGurukulPost>? _getGurukulPostRes;

  ApiResponse<ResGurukulPost>? get getGurukulPostRes => _getGurukulPostRes;

  ApiResponse<PostDetail>? _getGurukulPostDetailRes;

  ApiResponse<PostDetail>? get getGurukulPostDetailRes => _getGurukulPostDetailRes;

  HomeProviderImpl(this.repo){
    _getGurukulPostRes = ApiResponse();
    _getGurukulPostDetailRes = ApiResponse();
   // _res!.state = Status.LOADING;
  }


  int page = 1;
  int? totalPage = 1;

  List<ListPosts>? posts = [];


  @override
  Future getGurukulPost() async {

    try{
      apiResIsLoading(_getGurukulPostRes!);

      final res = await repo.getGurukulPost(page: page);

      if(res.status ==0){
        apiResIsFailed(_getGurukulPostRes!, res.message ?? '');
      } else if (res.status == 2) {
        apiResIsUnAuthorise(_getGurukulPostRes!, res.message ?? '');
      }

      final list = res.data?.list;

      list?.forEach((element) {
         posts?.add(element);
      });

      page += 1;
      totalPage = res.data?.totalPage ?? 1;

      apiResIsSuccess(_getGurukulPostRes!, res);

      notifyListeners();

    } catch(e){
      print(e);
      apiResIsFailed(_getGurukulPostRes!, e.toString());
    }

  }

  @override
  Future getGurukulPostDetails({int? id}) async {
    try {
      apiResIsLoading(_getGurukulPostDetailRes!);

      final res = await repo.getGurukulPostDetails(id: id);

      if (res == 0) {
        apiResIsFailed(_getGurukulPostDetailRes!, res.message ?? '');
      } else if (res.status == 2) {
        apiResIsUnAuthorise(_getGurukulPostDetailRes!, res.message ?? '');
      }

      apiResIsSuccess(_getGurukulPostDetailRes!, res);
    } catch (e) {
      print(e.toString());
      apiResIsFailed(_getGurukulPostDetailRes!, e.toString());
    }
  }

}