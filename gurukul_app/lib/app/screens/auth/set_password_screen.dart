import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gurukul_app/app/providers/auth_provider.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/show_snack_bar.dart';
import 'package:gurukul_app/app/views/base_button.dart';
import 'package:gurukul_app/app/views/base_text_field.dart';
import 'package:gurukul_app/app/views/common_images.dart';
import 'package:provider/provider.dart';

class SetPasswordScreen extends StatelessWidget {
  SetPasswordScreen({Key? key}) : super(key: key);

  TextEditingController passwordField = TextEditingController();
  TextEditingController confirmPasswordField = TextEditingController();

  Future setPassword(BuildContext context) async {
    try {
      await Provider.of<AuthProviderImpl>(context, listen: false).setPassword(password: passwordField.text, confirmPassword: confirmPasswordField.text);

      ShowSnackBar(context: context, message: 'Password set successfully please re login to enter the app.');

      Navigator.of(context).popUntil((route) => route.isFirst);

    } catch (e) {
      ShowSnackBar(context: context, message: '${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(30.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: kFlexibleSize(40.0)),
              Container(
                  height: kFlexibleSize(270.0),
                  width: double.infinity,
                  child: appIconImage),
              SizedBox(height: kFlexibleSize(50.0)),
              Text('Enter Password',style: kAuthTitleStyle,textAlign: TextAlign.start),
              SizedBox(height: kFlexibleSize(20.0)),
              BaseTextField(hint: 'Password',keyboardType: TextInputType.visiblePassword,secureText: true,controller: passwordField,),
              SizedBox(height: kFlexibleSize(15.0)),
              BaseTextField(hint: 'Confirm Password',keyboardType: TextInputType.visiblePassword,secureText: true,isLast: true,controller: confirmPasswordField,),
              SizedBox(height: kFlexibleSize(30.0)),
              setPasswordConsumer(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget setPasswordConsumer(BuildContext context) {

    return Consumer<AuthProviderImpl>(builder: (__, auth, _) {

      final isLoading = auth.updatePasswordRes?.state == Status.LOADING;

      return BaseAppButton(title: 'SET PASSWORD',isLoading: isLoading,onTap: (){
        if(isLoading){return;}
        setPassword(context);
      });
    },);

  }

}