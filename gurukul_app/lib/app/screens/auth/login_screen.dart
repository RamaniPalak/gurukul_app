import 'package:flutter/material.dart';
import 'package:gurukul_app/app/providers/auth_provider.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/show_snack_bar.dart';
import 'package:gurukul_app/app/views/base_button.dart';
import 'package:gurukul_app/app/views/base_text_field.dart';
import 'package:gurukul_app/app/views/common_images.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController mobileField;

  late TextEditingController passwordField;

  @override
  void initState() {
    super.initState();
    mobileField = TextEditingController();
    passwordField = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    mobileField.dispose();
    passwordField.dispose();
  }

  Future loginUser(BuildContext context) async {
    try {
      await Provider.of<AuthProviderImpl>(context, listen: false).logInUser(mobile: mobileField.text,password: passwordField.text);
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

    final auth = Provider.of<AuthProviderImpl>(context, listen: false);

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(30.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: kFlexibleSize(30.0)),
              Container(
                height: kFlexibleSize(250.0),
                width: double.infinity,
                  child: appIconImage),
              SizedBox(height: kFlexibleSize(50.0)),
              Text('Login to your Account',style: kAuthTitleStyle,textAlign: TextAlign.start),
              SizedBox(height: kFlexibleSize(20.0)),
              BaseTextField(hint: 'Mobile Number',keyboardType: TextInputType.phone,controller: mobileField,onChanged: (text){
                if (text.length > 9) {
                  FocusScope.of(context).requestFocus(FocusNode());
                }
              },autoFocus: true,),
              SizedBox(height: kFlexibleSize(10.0)),
              BaseTextField(hint: 'Password',keyboardType: TextInputType.visiblePassword,secureText: true,isLast: true,controller: passwordField,),
              InkWell(
                onTap: (){
                  auth.isUpdatingPassword = true;
                  Navigator.of(context).pushNamed(kEnterMobileRoute);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text('Forgot Password?',style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: kSmallFontSize,
                    fontWeight: FontWeight.w600,
                  ),textAlign: TextAlign.end),
                ),
              ),
              SizedBox(height: kFlexibleSize(10.0)),
              loginConsumer(context),
              SizedBox(height: kFlexibleSize(8.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t have an Account?',style: TextStyle(
                    color: kFontColor,
                    fontSize: kSmallFontSize,
                    fontWeight: FontWeight.w600,
                  )),
                  InkWell(
                    onTap: (){
                      auth.isUpdatingPassword = false;
                      Navigator.of(context).pushNamed(kEnterMobileRoute);
                    },
                    child: Container(
                      height: kFlexibleSize(44.0),
                      child: Center(
                        child: Text(' SIGN UP',style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: kSmallFontSize,
                          fontWeight: FontWeight.w700,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: kFlexibleSize(10.0)),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginConsumer(BuildContext context) {

    return Consumer<AuthProviderImpl>(builder: (__, auth, _) {

      final isLoading = auth.loginUserRes!.state == Status.LOADING;

      return BaseAppButton(title: 'LOG IN',isLoading: isLoading,onTap: (){
        if(isLoading){
          return;
        }
        loginUser(context);
      },);
    },) ;

  }
}
