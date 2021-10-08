import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  static UserPrefs shared = UserPrefs();

  // Set Local Data here
  Future setLocalData({required LocalUser user}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('IS_USER_LOGIN', user.isLogin);
    prefs.setString('USER_EMAIL', user.email);

    prefs.setInt('USER_ID', user.userID);
    prefs.setString('USER_NAME', user.fullName);
    prefs.setString('USER_MOBILE', user.mobile);
    prefs.setString('USER_IMAGE', user.image);
    prefs.setString('USER_TOKEN', user.token);

  }

  // Clear Local here
  Future<bool> clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.clear();
  }

  // Get User here
  Future<LocalUser> get getUser => _getUser();

  Future<LocalUser> _getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isLogin = prefs.getBool('IS_USER_LOGIN') ?? false;
    String email = prefs.getString('USER_EMAIL') ?? '';

    int userId = prefs.getInt('USER_ID') ?? 0;
    String name = prefs.getString('USER_NAME') ?? '';
    String mobile = prefs.getString('USER_MOBILE') ?? '';
    String image = prefs.getString('USER_IMAGE') ?? '';
    String token = prefs.getString('USER_TOKEN') ?? '';

    return LocalUser(isLogin: isLogin, email: email,mobile: mobile,fullName: name,image: image,token: token,userID: userId);
  }

  // Get is login here
  Future<bool> get isUserLogin => _isUserLogin();

  Future<bool> _isUserLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isLogin = prefs.getBool('IS_USER_LOGIN') ?? false;

    return isLogin;
  }
}

class LocalUser {
  final int userID;
  final String fullName;
  final String mobile;
  final String email;
  final String image;
  final String token;
  final bool isLogin;

  LocalUser(
      {required this.userID,
      required this.fullName,
      required this.mobile,
      required this.image,
      required this.token,
      required this.isLogin,
      required this.email});
}
