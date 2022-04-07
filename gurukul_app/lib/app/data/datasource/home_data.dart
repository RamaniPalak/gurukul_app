import 'package:gurukul_app/app/data/data_service/server_configs.dart';
import 'package:gurukul_app/app/data/data_service/web_service.dart';
import 'package:gurukul_app/app/data/entity/home_entity.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_gurukul_post.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_post_details.dart';
import 'package:gurukul_app/app/utils/messages.dart';
import 'package:gurukul_app/app/utils/user_prefs.dart';


abstract class HomeData{

  Future<ResGurukulPost> getGurukulPost({int? page});

  Future<PostDetail> getGurukulPostDetails({int? id});

}


class HomeDataImpl implements HomeData{

  @override
  Future<ResGurukulPost> getGurukulPost({int? page})  async {

    final res = await WebService.shared.postApiDIO(path: ServerConfigs.getGurukulPost,queryParameters: {
      'page' : page,
    });

    try {
      return ResGurukulPost.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<PostDetail> getGurukulPostDetails({int? id}) async {

    final res = await WebService.shared.getApiDIO(path: ServerConfigs.getGurukulPostDetail + '/$id');

    try {
      return PostDetail.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }

  }
}
