import 'package:flutter/material.dart';

Color kPrimaryColor = Color(0xffDF4A4A);
Color kBGColor = Color(0xffF3F4FA);
Color kFontColor = Color(0xff000000);



//Routes
String kInitialRoute = '/';
String kLoginRoute = '/LoginScreen';
String kProfileScreenRoute = '/ProfileScreen';
String kEnterMobileRoute = '/EnterMobileScreen';
String kEnterOTPRoute = '/EnterOTPScreen';
String kSignupRoute = '/SignupScreen';
String kForgotPasswordRoute = '/ForgotPasswordScreen';
String kNikolGurukulFormRoute = '/NikolGurukulForm';
String kNewsListScreenRoute = '/NewsListScreen';

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

final String  Sgrsgurukul= "એસજીઆરએસ ગુરુકુલ સાથે કેવી રીતે જોડાયલા છો?";
final String  oldSchool = "ક્યા ગુરુકુલ માં ભણેલા છો?";
final String  gurukulSelection = "હાલમા ક્યા ગુરુકુલ સાથે જોડાયલા છો?";
final String  saintSelection = "હાલમા ક્યા સંત સાથે જોડાયલા છો?";
final String  nikolGurukul = "નિકોલ ગુરુકુલ સાથે કોઈ સેવા માં જોડાયલા છો?";
final String sevaSelection = "નિકોલ ગુરુકુલ સાથે કોઈ સેવા માં જોડાવા માગો છો?";
final String  samajikSelection = "હાલમા અન્ય કોઈ સામાજિક સેવા માં જોડાયલા છો?";
final String  sansthanuname = "સંસ્થાનુ નામ";
final String  yearSelection = "ક્યા થી ક્યા સુધી ભણેલા છો?";
