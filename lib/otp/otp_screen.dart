import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:provider/provider.dart';
import 'package:sizary/instance_helper/instances.dart';
import 'package:sizary/otp/provider.dart';
import 'package:sizary/utils/colors.dart';
import 'package:sizary/utils/helper/constants.dart';
import 'package:sizary/utils/helper/timer_helper.dart';
import 'package:sizary/utils/page_route/navigator.dart';
import 'package:sizary/widget/text_view_widget.dart';

import 'model.dart';

class OtpPage extends StatefulWidget {

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  OtpProviders _otpProviders;
  UtilityProvider _utilityProvider;

  String pin;
  String token;
  String ref;

  @override
  void initState() {
    _otpProviders = Provider.of<OtpProviders>(context, listen: false);
    _otpProviders.init(context);
    _utilityProvider = Provider.of<UtilityProvider>(context, listen: false);
    _utilityProvider.startTimer(timeLimit: 4);
    init();
    super.initState();
  }

  init()async{
    token = await preferencesHelper.getStringValues(key: 'token');
    ref = constantRef;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('printing token: $token');
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColor.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Platform.isAndroid
                ? Icon(
              Icons.arrow_back,
              color: AppColor.black,
            )
                : Icon(
              Icons.navigate_before,
              color: AppColor.black,
            ),
            onPressed: () => PageRouter.goBack(context)),
      ),
      body: SingleChildScrollView(
        child: Consumer<UtilityProvider>(
          builder: (_, util, __) => Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextViewWidget(
                    text:
                    'A verification code has been sent to your provided Email Address.',
                    color: AppColor.black,
                    textSize: 18,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 77, right: 77),
                    child: TextViewWidget(
                      text: 'Please check your email and type the code below.',
                      color: AppColor.textColor,
                      textSize: 16,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  PinEntryTextField(
                    showFieldAsBox: false,
                    isTextObscure: false,
                    fields: 5,
                    onSubmit: (String pin) =>
                        _submitOtp(pin, util), // end onSubmit
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: util.timerIsNotExpired
                            ? 'Resend OTP in:  '
                            : 'I did\'t receive the code.  ',
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColor.black,
                            fontWeight: FontWeight.normal),
                        children: <TextSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => util.timerIsNotExpired
                                  ? null
                                  :
                              _otpProviders.resendOtp(
                                _utilityProvider,
                                  map: OtpModel.otpToJson(
                                      otp: int.parse(pin), ref: ref), token: token,),
                            text: util.timerIsNotExpired
                                ? '0${util.minute} : ${util.seconds.toString().length == 1 ? '0${util.seconds}' : util.seconds}'
                                : 'Resend OTP',
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColor.purple,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submitOtp(
      String pin,
      UtilityProvider util,
      ) async {
    if (util.timerIsNotExpired) {
      _otpProviders.verifyOtp(
          map: OtpModel.otpToJson(otp: int.parse(pin), ref: ref), token: token);
    }else{
      _otpProviders.resendOtp(
          _utilityProvider,
          map: OtpModel.otpToJson(ref:ref, otp: int.parse(pin)), token: token);
    }
  }
}