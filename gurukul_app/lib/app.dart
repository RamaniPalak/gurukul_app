import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gurukul_app/app/screens/auth/enter_mobile_screen.dart';
import 'package:gurukul_app/app/screens/auth/enter_otp_screen.dart';
import 'package:gurukul_app/app/screens/auth/login_screen_sample.dart';
import 'package:gurukul_app/app/screens/auth/set_password_screen.dart';
import 'package:gurukul_app/app/screens/auth/signup_screen.dart';
import 'package:gurukul_app/app/screens/lending_page.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'app/screens/news/news_list.dart';
import 'app/screens/nikol_gurukul/nikol_gurukul_form.dart';
import 'app/screens/profile/profile_screen.dart';

Widget app() {
  return MaterialApp(
    title: 'Gurukul Parivar',
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    theme: ThemeData(
      fontFamily: kRegularFonts,
      appBarTheme: AppBarTheme(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          foregroundColor: Colors.white,
          centerTitle: true,
          backwardsCompatibility: false,
          titleTextStyle: TextStyle(
              fontFamily: kRegularFonts,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white),
          systemOverlayStyle: Platform.isAndroid
              ? SystemUiOverlayStyle(
                  statusBarColor: kPrimaryColor,
                  statusBarBrightness: Brightness.light,
                  statusBarIconBrightness: Brightness.light,
                  systemNavigationBarIconBrightness: Brightness.light,
                )
              : SystemUiOverlayStyle.light),
      scaffoldBackgroundColor: kBGColor,
      primaryColor: kPrimaryColor,
      primarySwatch: Colors.red
    ),
    initialRoute: kInitialRoute,
    routes: {
      kInitialRoute: (context) => LendingPage(),
      kLoginRoute: (context) => LoginScreenSample(),
      kProfileScreenRoute: (context) => ProfileScreen(),
      kEnterMobileRoute: (context) => EnterMobileScreen(),
      kEnterOTPRoute: (context) => EnterOTPScreen(),
      kSignupRoute: (context) => SignUpScreen(),
      kForgotPasswordRoute: (context) => SetPasswordScreen(),
      kNikolGurukulFormRoute: (context) => NikolGurukulForm(),
      kNewsListScreenRoute: (context) => NewsListScreen(),
    },
  );
}
