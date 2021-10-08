import 'package:gurukul_app/app/data/data_service/web_service.dart';
import 'package:gurukul_app/app/data/entity/home_entity.dart';


abstract class HomeData{

  Future<Welcome> get();

}


class HomeDataImpl implements HomeData{
  @override
  Future<Welcome> get() async {

    final res = await WebService.shared.getApiDIO(path: "https://jsonplaceholder.typicode.com/todos/1");

    return Welcome.fromJson(res);

  }
}
