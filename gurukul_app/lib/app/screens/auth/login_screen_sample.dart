import 'package:flutter/material.dart';
import 'package:gurukul_app/app/providers/auth_provider.dart';
import 'package:gurukul_app/app/screens/base/base_state_less.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:provider/provider.dart';

class LoginScreenSample extends BaseStateLess {
  LoginScreenSample();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProviderImpl>(context, listen: false);

    Future loginUser() async {
      await authProvider.logInUser(mobile: '',password: '');
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: kFlexibleSize(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: kFlexibleSize(104),
                ),
                Text(
                  'Login',
                  style: TextStyle(fontSize: kBigFontSize),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: kFlexibleSize(32),
                ),
                Container(
                  width: double.infinity,
                  height: kFlexibleSize(52),
                  padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(10)),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.black, width: kFlexibleSize(2))),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Login',
                        border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: kFlexibleSize(16),
                ),
                Container(
                  width: double.infinity,
                  height: kFlexibleSize(52),
                  padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(10)),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.black, width: kFlexibleSize(2))),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: kFlexibleSize(16),
                ),
                InkWell(
                  onTap: (){
                    loginUser();
                  },
                  child: Container(
                    width: double.infinity,
                    height: kFlexibleSize(52),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(kFlexibleSize(6))),
                    child: Center(
                      child: Text('NEXT',style: TextStyle(
                          color: Colors.white,
                          fontSize: kFlexibleSize(13),
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
