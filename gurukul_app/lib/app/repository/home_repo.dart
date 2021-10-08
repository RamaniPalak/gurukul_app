import 'package:gurukul_app/app/data/datasource/home_data.dart';
import 'package:gurukul_app/app/data/entity/home_entity.dart';

class HomeRepository{

  final HomeData dataSource;

  HomeRepository({required this.dataSource});

  Future<Welcome> getData() async {
    return await dataSource.get();
  }

}