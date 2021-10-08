import 'package:gurukul_app/app/data/data_service/server_configs.dart';
import 'package:gurukul_app/app/data/data_service/web_service.dart';
import 'package:gurukul_app/app/data/entity/req_entity/req_send_otp.dart';
import 'package:gurukul_app/app/data/entity/req_entity/req_user_login.dart';
import 'package:gurukul_app/app/data/entity/req_entity/req_user_logout.dart';
import 'package:gurukul_app/app/data/entity/req_entity/req_user_sign_up.dart';
import 'package:gurukul_app/app/data/entity/req_entity/req_user_update_password_by_number.dart';
import 'package:gurukul_app/app/data/entity/req_entity/req_verify_otp.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_empty.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_current_version.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_send_otp.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_user_login.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_verify_otp.dart';
import 'package:gurukul_app/app/utils/messages.dart';

abstract class AuthData{
  Future<ResUserLogin> userLogin({required String mobile,required String password});
  Future<ResSendOtp> sendOtp({required String mobile,required bool isForgotPassword});
  Future<ResVerifyOtp> verifyOtp({required String mobile,required String otp});
  Future<ResUserLogin> userSignUp({required String name,required String email,required String mobile,required String password});
  Future<ResEmpty> userUpdatePasswordByNumber({required String mobile,required String password});
  Future<ResEmpty> userLogout({required int id});

  Future<ResGetCurrentVersion> getCurrentVersion();

}

class AuthDataImpl implements AuthData{
  @override
  Future<ResUserLogin> userLogin({required String mobile,required String password}) async{

    final res = await WebService.shared.postApiDIO(path: ServerConfigs.userLogin, data: ReqUserLogin(mobileNo: mobile,password: password).toJson());

    try {
      return ResUserLogin.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResSendOtp> sendOtp({required String mobile, required bool isForgotPassword}) async {

    final res = await WebService.shared.postApiDIO(path: ServerConfigs.sendOtp, data: ReqSendOtp(mobile: mobile,isForUpdatePassword: isForgotPassword ? 1 : 0).toJson());

    try {
      return ResSendOtp.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResVerifyOtp> verifyOtp({required String mobile, required String otp}) async {
    final res = await WebService.shared.postApiDIO(path: ServerConfigs.verifyOtp, data: ReqVerifyOtp(mobile: mobile,otp: otp).toJson());

    try {
      return ResVerifyOtp.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResUserLogin> userSignUp({required String name, required String email, required String mobile, required String password}) async {
    final res = await WebService.shared.postApiDIO(path: ServerConfigs.userSignUp, data: ReqUserSignUp(password: password, mobileNo: mobile, email: email, userName: name).toJson());

    try {
      return ResUserLogin.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResEmpty> userUpdatePasswordByNumber({required String mobile, required String password}) async {
    final res = await WebService.shared.postApiDIO(path: ServerConfigs.userUpdatePasswordByNumber, data: ReqUserUpdatePasswordByNumber(password: password,mobileNo: mobile).toJson());

    try {
      return ResEmpty.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResEmpty> userLogout({required int id}) async {
    final res = await WebService.shared.postApiDIO(path: ServerConfigs.userLogout, data: ReqUserLogout(userId: id).toJson());

    try {
      return ResEmpty.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResGetCurrentVersion> getCurrentVersion() async{
    final res = await WebService.shared.getApiDIO(path: ServerConfigs.getCurrentVersion);
    try {
      return ResGetCurrentVersion.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }
}
