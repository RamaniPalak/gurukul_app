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

class SignUpScreen extends BaseStateLess {
  SignUpScreen({Key? key}) : super(key: key);

  late TextEditingController fullNameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmPasswordController =
      TextEditingController();
  late TextEditingController mobileController = TextEditingController();

  Future signup(BuildContext context) async {
    try {
      await Provider.of<AuthProviderImpl>(context, listen: false).signUpUser(
          signup: SignUpModel(
              fullName: fullNameController.text,
              email: emailController.text,
              password: passwordController.text,
              confirmPassword: confirmPasswordController.text));

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
    final auth = Provider.of<AuthProviderImpl>(context, listen: false);

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(30.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: kFlexibleSize(270.0),
                  width: double.infinity,
                  child: appIconImage),
              Text('Create your Account',
                  style: kAuthTitleStyle, textAlign: TextAlign.start),
              SizedBox(height: kFlexibleSize(20.0)),
              BaseTextField(
                hint: 'Full Name',
                keyboardType: TextInputType.name,
                controller: fullNameController,
              ),
              SizedBox(height: kFlexibleSize(10.0)),
              BaseTextField(
                hint: '${auth.mobile}',
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                enabled: false,
              ),
              SizedBox(height: kFlexibleSize(10.0)),
              BaseTextField(
                hint: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
              ),
              SizedBox(height: kFlexibleSize(10.0)),
              BaseTextField(
                hint: 'Password',
                keyboardType: TextInputType.visiblePassword,
                secureText: true,
                controller: passwordController,
              ),
              SizedBox(height: kFlexibleSize(10.0)),
              BaseTextField(
                hint: 'Confirm Password',
                keyboardType: TextInputType.visiblePassword,
                secureText: true,
                isLast: true,
                controller: confirmPasswordController,
              ),
              SizedBox(height: kFlexibleSize(30.0)),
              signupConsumer(context),
              SizedBox(height: kFlexibleSize(30.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an Account?',
                      style: TextStyle(
                        color: kFontColor,
                        fontSize: kSmallFontSize,
                        fontWeight: FontWeight.w600,
                      )),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: Container(
                      height: kFlexibleSize(44.0),
                      child: Center(
                        child: Text(' SIGN IN',
                            style: TextStyle(
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

  Widget signupConsumer(BuildContext context) {

    return Consumer<AuthProviderImpl>(builder: (__, auth, _) {

      final isLoading = auth.loginUserRes?.state == Status.LOADING;

      return BaseAppButton(
        title: 'SIGN UP',
        isLoading: isLoading,
        onTap: () {
          signup(context);
        },
      );
    },);

  }
}
