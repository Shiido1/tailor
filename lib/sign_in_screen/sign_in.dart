import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailor_app/sign_in_screen/provider.dart';
import 'package:tailor_app/utils/colors.dart';
import 'package:tailor_app/utils/helper/helper.dart';
import 'package:tailor_app/utils/page_route/route.dart';
import 'package:tailor_app/utils/user_provider.dart';
import 'package:tailor_app/widget/text_field_editing_widget.dart';
import 'package:tailor_app/widget/text_view_widget.dart';

import 'model.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SignInProvider signInProvider;

  bool _isEmail = false;
  bool _isPassword = false;

  @override
  void initState() {
    signInProvider = Provider.of<SignInProvider>(context, listen:false);
    signInProvider.initialize(context);
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool _validateInput(){
    if (emailController.text.isEmpty ||
        !validateEmail(emailController.text)) {
      setState(() => _isEmail = true);
      return false;
    }

    if (passwordController.text.isEmpty) {
      setState(() => _isPassword = true);
      return false;
    }

    return true;
  }

  void signIn() {
    if (_validateInput())
      signInProvider.loginUser(
          map: LoginModel.toLoginJson(
              email: emailController.text,
              password: passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16,right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children:[
              SizedBox(height: 60,),
              TextViewWidget(
                text: 'Sign In',
                textSize: 30,
                color: AppColor.black,
                fontWeight: FontWeight.w600,),
              SizedBox(height: 150),
              EditTextWidget(
                err: 'please enter email address',
                label: 'Email',
                textInputType: TextInputType.text,
                controller: emailController,
                isValidationError: _isEmail,
                textCallBack: (_) => setState(() => _isEmail = false),),
              EditTextWidget(
                err: 'please enter password',
                label: 'Password',
                textInputType: TextInputType.text,
                controller: passwordController,
                isValidationError: _isPassword,
                textCallBack: (_) => setState(() => _isPassword = false),),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right:16),
                  child: TextViewWidget(
                      text: 'Forgot Password',
                      textAlign: TextAlign.right,
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                      textSize: 18),
                ),
              ),
              SizedBox(height: 35,),
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    print('you press meee');
                      signIn();
                    },
                  style: TextButton
                      .styleFrom(
                    backgroundColor:
                    AppColor.purple,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextViewWidget(
                      text: 'Sign In',
                      color: AppColor.white,
                      textSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35,),
              Center(
                child: InkWell(
                  onTap: (){},
                  child: TextViewWidget(
                    text: 'Not a Member? -->',
                    color: AppColor.black,
                    fontWeight: FontWeight.w600,
                    textSize: 22,),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}
