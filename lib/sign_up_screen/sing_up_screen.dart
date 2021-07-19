import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizary/instance_helper/instances.dart';
import 'package:sizary/sign_up_screen/provider.dart';
import 'package:sizary/utils/colors.dart';
import 'package:sizary/utils/helper/constants.dart';
import 'package:sizary/utils/helper/helper.dart';
import 'package:sizary/utils/page_route/navigator.dart';
import 'package:sizary/widget/text_field_editing_widget.dart';
import 'package:sizary/widget/text_view_widget.dart';

import 'model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  SignUpProviders signUpProviders;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String accountTypeValue;
  String countryValue;
  List country = countries;

  bool _isFirstName = false;
  bool _isLastName = false;
  bool _isEmail = false;
  List accountType = ['tailor','client'];

  bool _isPhone = false;
  bool _isPassword = false;
  bool _isConfirmPassword = false;
  bool _isAccountType = false;
  bool _isCountry = false;

  bool _validateInputs() {
    if (firstNameController.text.isEmpty) {
      setState(() => _isFirstName = true);
      return false;
    }
    if (lastNameController.text.isEmpty) {
      setState(() => _isLastName = true);
      return false;
    }

    if (emailController.text.isEmpty ||
        !validateEmail(emailController.text)) {
      setState(() => _isEmail = true);
      return false;
    }

    if (phoneController.text.isEmpty) {
      setState(() => _isPhone = true);
      return false;
    }

    if(accountTypeValue.isEmpty){
      setState(()=> _isAccountType = true);
      return false;
    }

    if(countryValue.isEmpty){
      setState(()=> _isCountry = true);
      return false;
    }

    if (passwordController.text.isEmpty) {
      setState(() => _isPassword = true);
      return false;
    }

    if (confirmPasswordController.text.isEmpty ||
        confirmPasswordController.text != passwordController.text) {
      setState(() => _isConfirmPassword = true);
      return false;
    }
    return true;
  }

  void _signUpUser() {
    FocusScope.of(context).unfocus();

    if (!_validateInputs()) return;

    email = emailController.text;
    password = passwordController.text;
    phone = phoneController.text;
    account_type = accountTypeValue;
    signUpProviders.signUp(
        map: SignUpModel.toJson(
            email:emailController.text.trim(),
            password:passwordController.text.trim(),
            cPassword:confirmPasswordController.text.trim(),
            firstName:firstNameController.text.trim(),
            lastName:lastNameController.text.trim(),
            country:countryValue,
            accountType:accountTypeValue,
            phone:phoneController.text.trim()
        ));
    setState(() {});
  }

  @override
  void initState() {
    signUpProviders = Provider.of<SignUpProviders>(context, listen: false);
    signUpProviders.init(context);
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 40,),
              TextViewWidget(
                text: 'Sign Up',
                textSize: 30,
                color: AppColor.black,
                fontWeight: FontWeight.w600,),
              SizedBox(height: 30),
              EditTextWidget(
                  err: 'please enter first name',
                  label: 'First Name',
                  textInputType: TextInputType.text,
                  controller: firstNameController,
                  isValidationError: _isFirstName,
                  textCallBack: (_) => setState(() => _isFirstName = false),),
              EditTextWidget(
                  err:'please enter last name',
                  label: 'Last Name',
                  textInputType: TextInputType.text,
                  controller: lastNameController,
                isValidationError: _isLastName,
                textCallBack: (_) => setState(() => _isLastName = false),),
              EditTextWidget(
                  err: 'please enter email address',
                  label: 'Email',
                  textInputType: TextInputType.text,
                  controller: emailController,
                isValidationError: _isEmail,
                textCallBack: (_) => setState(() => _isEmail = false),),
              EditTextWidget(
                  err: 'please enter phone number',
                  label: 'Phone Number',
                  textInputType: TextInputType.number,
                  controller: phoneController,
                isValidationError: _isPhone,
                textCallBack: (_) => setState(() => _isPhone = false),),
              Container(
                margin: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.black)
                ),
                child: DropdownButton(
                  isExpanded: true,
                    hint: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextViewWidget(
                        text: 'Account Type',
                        color: AppColor.textColor,textSize: 14,
                        fontWeight: FontWeight.w500,),
                    ),
                    value: accountTypeValue,
                    onChanged: (value){
                      setState(() {
                        accountTypeValue = value;
                      });
                    },
                    items: accountType.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextViewWidget(
                            text: value,color: AppColor.black,),
                        ),
                      );
                    }).toList()),
              ),
              Container(
                margin: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.black)
                ),
                child: DropdownButton(
                    isExpanded: true,
                    hint: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextViewWidget(
                        text: 'Country',
                        color: AppColor.textColor,textSize: 14,
                        fontWeight: FontWeight.w500,),
                    ),
                    value: countryValue,
                    onChanged: (value){
                      setState(() {
                        countryValue = value;
                      });
                    },
                    items: country.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextViewWidget(
                            text: value,color: AppColor.black,),
                        ),
                      );
                    }).toList()),
              ),
              EditTextWidget(
                  err: 'please enter password',
                  label: 'Password',
                  textInputType: TextInputType.text,
                  controller: passwordController,
                isValidationError: _isPassword,
                textCallBack: (_) => setState(() => _isPassword = false),),
              EditTextWidget(
                  err: 'please enter password',
                  label: 'Confirm Password',
                  textInputType: TextInputType.text,
                  controller: confirmPasswordController,
                isValidationError: _isConfirmPassword,
                textCallBack: (_) => setState(() => _isConfirmPassword= false),),
              SizedBox(height: 25,),
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    print('you press meee');
                    _signUpUser();},
                  style: TextButton
                      .styleFrom(
                    backgroundColor:
                    AppColor.purple,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextViewWidget(
                      text: 'Sign Up',
                      color: AppColor.white,
                      textSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Already have an account? --> ',
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColor.black,
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              PageRouter.gotoNamed(Routes.LOGIN, context),
                        text: 'Sign In',
                        style: TextStyle(
                            fontSize: 21,
                            color: AppColor.purple,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
