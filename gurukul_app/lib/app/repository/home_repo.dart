import 'package:gurukul_app/app/data/datasource/home_data.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_gurukul_post.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_post_details.dart';

class HomeRepository{

  final HomeData dataSource;

  HomeRepository({required this.dataSource});

  Future<ResGurukulPost> getGurukulPost({int? page}) async {
    return await dataSource.getGurukulPost(page: page);
  }

  Future<PostDetail> getGurukulPostDetails({int? id}) async {
    return await dataSource.getGurukulPostDetails(id: id);
  }

}