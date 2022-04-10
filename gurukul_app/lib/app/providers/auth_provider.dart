import 'dart:io';

import 'package:gurukul_app/app/data/entity/res_entity/res_empty.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_get_current_version.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_send_otp.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_user_login.dart';
import 'package:gurukul_app/app/data/entity/res_entity/res_verify_otp.dart';
import 'package:gurukul_app/app/providers/base_notifier.dart';
import 'package:gurukul_app/app/repository/auth_repository.dart';
import 'package:gurukul_app/app/utils/api_response.dart';
import 'package:gurukul_app/app/utils/extensions.dart';
import 'package:gurukul_app/app/utils/messages.dart';
import 'package:gurukul_app/app/utils/user_prefs.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AuthProvider {
  Future getUserFromLocal() async {}

  Future logInUser({required String mobile, required String password}) async {}

  Future signUpUser({required SignUpModel signup}) async {}

  Future logOutUser() async {}

  Future unAuthorizeUser() async {}

  Future getOTP({required String mobile}) async {}

  Future verifyOTP({required String otp}) async {}

  Future setPassword(
      {required String password, required String confirmPassword}) async {}

  Future versionControl() async {}

  Future<ResGetCurrentVersion?> getCurrentVersion() async{}
}

class AuthProviderImpl extends BaseNotifier implements AuthProvider {
  late AuthRepository repo;

  Future<PackageInfo> get packageInfo async => await PackageInfo.fromPlatform();

  //Constructor
  AuthProviderImpl(this.repo) {
    getUserFromLocal();
    versionControl();
    _loginUserRes = ApiResponse();
    _sendOtpRes = ApiResponse();
    _verifyOtpRes = ApiResponse();
    _updatePasswordRes = ApiResponse();
    _logoutRes = ApiResponse();
  }

  //Variables
  bool? isLogin;

  bool? isNewUpdateAvailable;

  bool? isAppUnderMaintenance;


  String? mobile;

  bool? isUpdatingPassword;

  //Api responses

  ApiResponse<ResUserLogin>? _loginUserRes;

  ApiResponse<ResUserLogin>? get loginUserRes => _loginUserRes;

  ApiResponse<ResSendOtp>? _sendOtpRes;

  ApiResponse<ResSendOtp>? get sendOtpRes => _sendOtpRes;

  ApiResponse<ResVerifyOtp>? _verifyOtpRes;

  ApiResponse<ResVerifyOtp>? get verifyOtpRes => _verifyOtpRes;

  ApiResponse<ResEmpty>? _updatePasswordRes;

  ApiResponse<ResEmpty>? get updatePasswordRes => _updatePasswordRes;

  ApiResponse<ResEmpty>? _logoutRes;

  ApiResponse<ResEmpty>? get logoutRes => _logoutRes;

  @override
  Future getUserFromLocal() async {
    // TODO: Setting the perfect model for local user

    isLogin = await UserPrefs.shared.isUserLogin;

    print('is User Logged in: $isLogin');

    notifyListeners();
  }

  //Apis
  @override
  Future logInUser({required String mobile, required String password}) async {
    try {
      apiResIsLoading(_loginUserRes!);

      if (mobile.isEmpty || password.isEmpty) {
        throw emptyFieldsMsg;
      }

      if(!mobile.isValidMobile){
        throw 'Please enter valid mobile number.';
      }

      final res = await repo.userLogin(mobile: mobile, password: password);

      if (res.status != 1) {
        throw res.message ?? '';
      }

      isLogin = true;

      await UserPrefs.shared.setLocalData(
          user: LocalUser(
              isLogin: true,
              email: res.data?.email ?? '',
              token: res.data?.token ?? '',
              userID: res.data?.userId ?? 0,
              image: res.data?.image ?? '',
              fullName: res.data?.userName ?? '',
              mobile: res.data?.mobileNo ?? ''));

      apiResIsSuccess(_loginUserRes!, res);
    } catch (e) {
      apiResIsFailed(_loginUserRes!, e);
      rethrow;
    }
  }

  @override
  Future logOutUser() async {
    try {
      apiResIsLoading(_logoutRes!);

      final user = await UserPrefs.shared.getUser;

      final res = await repo.userLogout(id: user.userID);

      if (res.status == 0) {
        await UserPrefs.shared.clear();

        isLogin = false;

        apiResIsSuccess(_logoutRes!, res);
        throw res.message ?? '';
      }else if (res.status == 2) {
        await UserPrefs.shared.clear();

        isLogin = false;

        apiResIsSuccess(_logoutRes!, res);
        apiResIsUnAuthorise(_logoutRes!, res.message ?? '');
      }else{
        await UserPrefs.shared.clear();

        isLogin = false;

        apiResIsSuccess(_logoutRes!, res);
      }
    } catch (e) {
      apiResIsFailed(_logoutRes!, e);
    }
  }

  @override
  Future unAuthorizeUser() async {
    await UserPrefs.shared.clear();

    isLogin = false;

    notifyListeners();
  }

  @override
  Future getOTP({required String mobile}) async {
    try {
      apiResIsLoading(_sendOtpRes!);
      this.mobile = mobile;
      if (mobile.isEmpty) {
        throw emptyFieldsMsg;
      }

      if(!mobile.isValidMobile){
        throw 'Please enter valid mobile number.';
      }

      final res = await repo.sendOtp(
          mobile: mobile, isForgotPassword: this.isUpdatingPassword ?? false);

      if (res.status != 1) {
        throw res.message ?? '';
      }

      apiResIsSuccess(_sendOtpRes!, res);
    } catch (e) {
      apiResIsFailed(_sendOtpRes!, e);
      rethrow;
    }
  }

  @override
  Future verifyOTP({required String otp}) async {
    try {
      apiResIsLoading(_verifyOtpRes!);
      if (otp.isEmpty) {
        throw emptyFieldsMsg;
      }

      final res = await repo.verifyOtp(mobile: this.mobile ?? '', otp: otp);

      if (res.status != 1) {
        throw res.message ?? '';
      }

      if (res.data?.isVerified != 1) {
        throw res.message ?? '';
      }

      apiResIsSuccess(_verifyOtpRes!, res);
    } catch (e) {
      apiResIsFailed(_verifyOtpRes!, e);
      rethrow;
    }
  }

  @override
  Future signUpUser({required SignUpModel signup}) async {
    try {
      if (signup.fullName.isEmpty ||
          this.mobile!.isEmpty ||
          signup.email.isEmpty ||
          signup.password.isEmpty ||
          signup.confirmPassword.isEmpty) {
        throw emptyFieldsMsg;
      }

      if(!signup.email.isValidEmail){
        throw 'Please enter valid Email Address.';
      }

      if(signup.password.length < 8){
        throw 'Password should be at least 8 charters.';
      }

      if (signup.password != signup.confirmPassword) {
        throw passwordMatchMsg;
      }

      apiResIsLoading(_loginUserRes!);

      final res = await repo.userSignUp(name: signup.fullName, email: signup.email, mobile: mobile ?? '', password: signup.password);

      if (res.status != 1) {
        throw res.message ?? '';
      }

      isLogin = true;

      await UserPrefs.shared.setLocalData(
          user: LocalUser(
              isLogin: true,
              email: res.data?.email ?? '',
              token: res.data?.token ?? '',
              userID: res.data?.userId ?? 0,
              image: res.data?.image ?? '',
              fullName: res.data?.userName ?? '',
              mobile: res.data?.mobileNo ?? ''));

      apiResIsSuccess(_loginUserRes!, res);

    } catch (e) {
      apiResIsFailed(_loginUserRes!, e);
      rethrow;
    }
  }

  @override
  Future setPassword(
      {required String password, required String confirmPassword}) async {
    try {
      if (password.isEmpty || confirmPassword.isEmpty) {
        throw emptyFieldsMsg;
      }

      if(password.length < 8){
        throw 'Password should be at least 8 charters.';
      }

      if (password != confirmPassword) {
        throw passwordMatchMsg;
      }

      apiResIsLoading(_updatePasswordRes!);

      final res = await repo.userUpdatePasswordByNumber(mobile: mobile ?? '', password: password);

      if (res.status != 1) {
        throw res.message ?? '';
      }

      apiResIsSuccess(_updatePasswordRes!, res);

    } catch (e) {
      apiResIsFailed(_updatePasswordRes!, e);
      rethrow;
    }
  }

  bool compareVersions({required String serverVersion, required String mobileVersion}) {

    try {
      final serverVersions = serverVersion.split('.');
      final localVersions = mobileVersion.split('.');

      var isLocalBig = true;

      for(var i = 0; i < serverVersions.length; i++){

        final serverVersion = int.parse(serverVersions[i]);
        final localVersion = int.parse(localVersions[i]);

        print('mobile = $localVersion server = $serverVersion check ${serverVersion < localVersion}');

        if(serverVersion == localVersion){
          continue;
        }

        isLocalBig = serverVersion < localVersion;

        if(isLocalBig){
          break;
        }
      }

      return isLocalBig;

    } catch (e) {
      print(e);
      return true;
    }

  }

  @override
  Future versionControl() async {

    final res = await getCurrentVersion();

    isAppUnderMaintenance = res?.data?.isUnderMaintenance == 1;
    notifyListeners();

    if(isAppUnderMaintenance == true){
      return;
    }

    final package = await PackageInfo.fromPlatform();

    if(Platform.isAndroid){
      isNewUpdateAvailable = !compareVersions(serverVersion: '${res?.data?.androidAppVersion}', mobileVersion: '${package.version}');
    }else{
      isNewUpdateAvailable = !compareVersions(serverVersion: '${res?.data?.iosAppVersion}', mobileVersion: '${package.version}');
    }

    print("res?.data?.iosAppVersion ${res?.data?.iosAppVersion}");

    print("package.version ${package.version}");

    print("isNewUpdateAvailable $isNewUpdateAvailable");

    notifyListeners();

  }

  @override
  Future<ResGetCurrentVersion?> getCurrentVersion() async{
    try {
      final res = await repo.getCurrentVersion();
      return res;
    } catch (e) {
      print(e);
    }
  }
}

class SignUpModel {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpModel(
      {required this.fullName,
      required this.email,
      required this.password,
      required this.confirmPassword});
}
