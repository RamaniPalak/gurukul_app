import 'package:gurukul_app/app/data/datasource/auth_data.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_empty.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_current_version.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_send_otp.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_user_login.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_verify_otp.dart';

class AuthRepository{

  final AuthData dataSource;

  AuthRepository({required this.dataSource});

  Future<ResUserLogin> userLogin({required String mobile,required String password}) async{
    return await dataSource.userLogin(mobile: mobile, password: password);
  }

  Future<ResSendOtp> sendOtp({required String mobile, required bool isForgotPassword}) async {
    return await dataSource.sendOtp(mobile: mobile,isForgotPassword: isForgotPassword);
  }

  Future<ResVerifyOtp> verifyOtp({required String mobile, required String otp}) async {
    return await dataSource.verifyOtp(mobile: mobile, otp: otp);
  }

  Future<ResUserLogin> userSignUp({required String name, required String email, required String mobile, required String password}) async {
    return await dataSource.userSignUp(name: name, email: email, mobile: mobile, password: password);
  }

  Future<ResEmpty> userUpdatePasswordByNumber({required String mobile, required String password}) async {
    return await dataSource.userUpdatePasswordByNumber(mobile: mobile, password: password);
  }

  Future<ResEmpty> userLogout({required int id}) async {
    return await dataSource.userLogout(id: id);
  }

  Future<ResGetCurrentVersion> getCurrentVersion() async{
    return await dataSource.getCurrentVersion();
  }

}