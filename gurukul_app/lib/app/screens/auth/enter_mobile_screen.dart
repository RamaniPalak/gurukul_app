import 'package:flutter/material.dart';
import 'package:gurukul_app/app/providers/auth_provider.dart';
import 'package:gurukul_app/app/screens/base/base_state_less.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/show_snack_bar.dart';
import 'package:gurukul_app/app/views/base_button.dart';
import 'package:gurukul_app/app/views/base_text_field.dart';
import 'package:gurukul_app/app/views/common_images.dart';
import 'package:provider/provider.dart';

class EnterMobileScreen extends BaseStateLess {
  EnterMobileScreen({Key? key}) : super(key: key);

  TextEditingController mobileField = TextEditingController();

  Future getOTP(BuildContext context) async {
    try {

      final auth = Provider.of<AuthProviderImpl>(context, listen: false);

      await auth.getOTP(mobile: mobileField.text);

      Navigator.of(context).pushNamed(kEnterOTPRoute);

      ShowSnackBar(context: context, message: '${auth.sendOtpRes?.data?.message ?? ''}');

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
              Text('Enter Mobile Number',style: kAuthTitleStyle,textAlign: TextAlign.start),
              SizedBox(height: kFlexibleSize(20.0)),
              BaseTextField(hint: 'Mobile Number',keyboardType: TextInputType.phone,isLast: true,controller: mobileField,autoFocus: true,onChanged: (text){
                if (text.length > 9) {
                  FocusScope.of(context).requestFocus(FocusNode());
                }
              },),
              SizedBox(height: kFlexibleSize(30.0)),
              mobileConsumer(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget mobileConsumer(BuildContext context) {

    return Consumer<AuthProviderImpl>(builder: (_, auth, __) {

      final isLoading = auth.sendOtpRes!.state == Status.LOADING;

      return BaseAppButton(title: 'GET OTP',isLoading: isLoading,onTap: (){
        if(isLoading){
          return;
        }
        getOTP(context);
      });
    },);

  }

}
