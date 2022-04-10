import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gurukul_app/app/providers/auth_provider.dart';
import 'package:gurukul_app/app/screens/base/base_state_full.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/extensions.dart';
import 'package:gurukul_app/app/utils/show_snack_bar.dart';
import 'package:gurukul_app/app/views/base_button.dart';
import 'package:gurukul_app/app/views/common_images.dart';
import 'package:provider/provider.dart';

class EnterOTPScreen extends BasePage {
  EnterOTPScreen({Key? key}) : super(key: key);

  @override
  _EnterOTPScreenState createState() => _EnterOTPScreenState();
}

class _EnterOTPScreenState extends BaseState<EnterOTPScreen> {
  String otpTexts = '';
  late TextEditingController otpController;

  Future verifyOTP(BuildContext context) async {
    try {

      final auth = Provider.of<AuthProviderImpl>(context, listen: false);

      await auth.verifyOTP(otp: otpController.text);

      if (auth.isUpdatingPassword == true){
        Navigator.of(context).pushNamed(kForgotPasswordRoute);
      }else{
        Navigator.of(context).pushNamed(kSignupRoute);
      }
    } catch (e) {
      ShowSnackBar(context: context, message: '${e.toString()}');
    }
  }

  final otpDigits = 4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    otpController = TextEditingController();

    final auth = Provider.of<AuthProviderImpl>(context,listen: false);
    setState(() {
      // otpController.text = (auth.sendOtpRes?.data?.data?.otp ?? null)?.toString() ?? '';
      // otpTexts = otpController.text;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    otpController.dispose();
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
              Text('Enter OTP',
                  style: kAuthTitleStyle, textAlign: TextAlign.start),
              SizedBox(height: kFlexibleSize(20.0)),
              Container(
                height: kFlexibleSize(45.0),
                child: fields(context),
              ),
              SizedBox(height: kFlexibleSize(30.0)),
              verifyOtpConsumer(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget verifyOtpConsumer(BuildContext context) {

    return Consumer<AuthProviderImpl>(builder: (_, auth, __) {

      final isLoading = auth.verifyOtpRes?.state == Status.LOADING;

      return BaseAppButton(
        title: 'CONTINUE',
        isLoading: isLoading,
        onTap: (){
          if(isLoading){

          }
          verifyOTP(context);
        },
      );
    },);

  }

  Widget fields(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          List.generate(otpDigits, (index) {
            return otpField(text: '${otpTexts.safeIndexStrFrom(index)}');
          }
          )
          // [
          //   otpField(text: '${otpTexts.safeIndexStrFrom(0)}'),
          //   otpField(text: '${otpTexts.safeIndexStrFrom(1)}'),
          //   otpField(text: '${otpTexts.safeIndexStrFrom(2)}'),
          //   otpField(text: '${otpTexts.safeIndexStrFrom(3)}'),
          // ],
        ),
        TextField(
          autofocus: true,
          controller: otpController,
          onChanged: (text) {

            if (text.length <= otpDigits) {
              setState(() {
                otpTexts = text;
              });
            }

            if (text.length > otpDigits - 1) {
              FocusScope.of(context).requestFocus(FocusNode());
              otpController.text = this.otpTexts;
            }
          },
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ],
          maxLines: 1,
          showCursor: false,
          cursorColor: Colors.transparent,
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.transparent,letterSpacing: kFlexibleSize(56.5)),
          cursorHeight: 0.0,
          cursorWidth: 0.0,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusColor: Colors.transparent,
              fillColor: Colors.transparent,
              hoverColor: Colors.transparent),
        )
      ],
    );
  }

  Widget otpField({required String text}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: kFlexibleSize(5.0)),
        height: kFlexibleSize(45.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: text.isEmpty ? kCommonShadow : kCommonRedShadow,
        ),
        child: Container(
          width: double.infinity,
          child: Center(
            child: Text(
              '$text',
              style: TextStyle(
                fontSize: kBigFontSize,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
