import 'package:flutter/material.dart';

Color kPrimaryColor = Color(0xffDF4A4A);
Color kBGColor = Color(0xffF3F4FA);
Color kFontColor = Color(0xff000000);



//Routes
String kInitialRoute = '/';
String kLoginRoute = '/LoginScreen';
String kHomeRoute = '/HomeScreen';
String kEnterMobileRoute = '/EnterMobileScreen';
String kEnterOTPRoute = '/EnterOTPScreen';
String kSignupRoute = '/SignupScreen';
String kForgotPasswordRoute = '/ForgotPasswordScreen';

//FontFamily
String kRegularFonts = "Mulish";

//Resolution Handle
double kFontRatio = 1.0;

final double kBigFontSize = 18 * kFontRatio;
final double kMediumFontSize = 16 * kFontRatio;
final double kRegularFontSize = 14 * kFontRatio;
final double kSmallFontSize = 12 * kFontRatio;

double kFlexibleSize(double size){
  return size * kFontRatio;
}
final kAppbarTitle = TextStyle(color: Colors.white, fontSize: kMediumFontSize,
  fontFamily: kRegularFonts
);

final kTextBold = TextStyle(color: Colors.black, fontSize: kRegularFontSize,
    fontFamily: kRegularFonts,fontWeight: FontWeight.w700
);

final kTitleStyle = TextStyle(
    color: Colors.black,
    fontSize: kRegularFontSize,
    fontWeight: FontWeight.w700);

final kDetailsStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: kSmallFontSize
);

final kCommonShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.1),
    spreadRadius: 0,
    blurRadius: 20,
    offset: Offset(0, 10), // changes position of shadow
  ),
];

final kCommonRedShadow = [
  BoxShadow(
    color: kPrimaryColor.withOpacity(0.3),
    spreadRadius: 0,
    blurRadius: 20,
    offset: Offset(0, 10), // changes position of shadow
  ),
];

//Common text styles

get kAuthTitleStyle => TextStyle(
  color: kFontColor,
  fontSize: kRegularFontSize,
  fontWeight: FontWeight.w400,
);