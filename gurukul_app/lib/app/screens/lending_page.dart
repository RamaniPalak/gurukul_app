import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gurukul_app/app/providers/auth_provider.dart';
import 'package:gurukul_app/app/screens/auth/login_screen.dart';
import 'package:gurukul_app/app/screens/base/base_state_less.dart';
import 'package:gurukul_app/app/screens/helper_screens/splash_screen.dart';
import 'package:gurukul_app/app/screens/helper_screens/stuck_page.dart';
import 'package:gurukul_app/app/screens/home/home_screen.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:provider/provider.dart';

class LendingPage extends BaseStateLess{

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    kFontRatio = size.width / 375;//375 will de designer's width for iphone 12 size

    print('$kFontRatio ${size.width} ${size.height}');

    return Consumer<AuthProviderImpl>(builder: (context, auth, __) {

      if (auth.isAppUnderMaintenance == null){
        return SplashScreen();
      }

      if(auth.isAppUnderMaintenance == true){
        return StuckTheAppPage(btnTap: (){}, text: 'App is under maintenance. Please try again latter.', btnText: 'Try again!');
      }

      if (auth.isNewUpdateAvailable == null){
        return SplashScreen();
      }

      if(auth.isNewUpdateAvailable == true){
        return StuckTheAppPage(btnTap: (){}, text: 'New update available, please click on go to update the app.', btnText: 'Update');
      }

      if (auth.isLogin == null){
        return SplashScreen();
      }

      if (auth.isLogin ?? false){
        return HomeScreen();
      }else{
        return LoginScreen();
      }

    },);
  }
}
