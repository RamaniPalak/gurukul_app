import 'package:flutter/material.dart';
import 'package:gurukul_app/app/screens/base/base_state_less.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/views/common_images.dart';

class SplashScreen extends BaseStateLess {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Container(
          width: double.infinity,
          child: splashImage,
        ),
      ),
    );
  }
}
