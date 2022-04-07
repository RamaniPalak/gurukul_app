import 'package:gurukul_app/app/data/datasource/auth_data.dart';
import 'package:gurukul_app/app/data/datasource/home_data.dart';
import 'package:gurukul_app/app/data/datasource/profile_data.dart';
import 'package:gurukul_app/app/data/datasource/service_data.dart';
import 'package:gurukul_app/app/providers/auth_provider.dart';
import 'package:gurukul_app/app/providers/home_provider.dart';
import 'package:gurukul_app/app/providers/profile_provider.dart';
import 'package:gurukul_app/app/providers/serviceProvider.dart';
import 'package:gurukul_app/app/repository/auth_repository.dart';
import 'package:gurukul_app/app/repository/home_repo.dart';
import 'package:gurukul_app/app/repository/profile_repository.dart';
import 'package:gurukul_app/app/repository/service_repository.dart';

HomeProviderImpl get homeProvider => HomeProviderImpl(HomeRepository(dataSource: HomeDataImpl()));
AuthProviderImpl get authProvider => AuthProviderImpl(AuthRepository(dataSource: AuthDataImpl()));
ServiceProviderImpl get serviceProvider => ServiceProviderImpl(ServiceRepository(dataSource: ServiceDataImpl()));
ProfileProviderImpl get profileProvider => ProfileProviderImpl(ProfileRepository(dataSource: ProfileDataImpl()),serviceProvider);

