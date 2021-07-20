import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizary/sign_in_screen/provider.dart';
import 'package:sizary/sign_in_screen/repo.dart';
import 'package:sizary/utils/colors.dart';
import 'package:sizary/utils/helper/helper.dart';
import 'package:sizary/utils/page_route/navigator.dart';
import 'package:sizary/utils/page_route/route.dart';
import 'package:sizary/widget/text_field_editing_widget.dart';
import 'package:sizary/widget/text_view_widget.dart';
import 'model.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController emailController;
  TextEditingController passwordController;
  SignInProvider signInProvider;
  LoginApiRepository loginApiRepository;

  bool _isEmail = false;
  bool _isPassword = false;

  AuthenticationProfile profile;

  @override
  void initState() {
     emailController = TextEditingController();
     passwordController = TextEditingController();
    signInProvider = Provider.of<SignInProvider>(context, listen:false);
    signInProvider.initialize(context);
    profile = Provider.of<AuthenticationProfile>(context, listen: false);
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
    FocusScope.of(context).unfocus();
    if (_validateInput())
      signInProvider.loginUser(
          map: LoginModel.toJson(
              email: emailController.text.trim(),
              password: passwordController.text.trim()), context: context);
    profile.isAuthentificated = true;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SignInProvider>(
        builder: (_, model, __) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                    color: AppColor.black,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      colorFilter: new ColorFilter.mode(
                          AppColor.white.withOpacity(0.7), BlendMode.dstATop),
                      image: new AssetImage(
                        'assets/male_tailor.jpg',
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 16,right: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:[
                          SizedBox(height: 60,),
                          TextViewWidget(
                            text: 'Sign In',
                            textSize: 30,
                            color: AppColor.black,
                            fontWeight: FontWeight.w600,),
                        ]
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SvgPicture.asset('assets/login_rect_svg.svg'),
                ),

                Positioned(
                  bottom: 10,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        EditTextWidget(
                          paddedSide: true,
                          color: AppColor.white,
                          err: 'please enter email address',
                          label: 'Email',
                          textInputType: TextInputType.text,
                          controller: emailController,
                          isValidationError: _isEmail,
                          textCallBack: (_) => setState(() => _isEmail = false),),
                        EditTextWidget(
                          obsecure: true,
                          paddedSide: true,
                          color: AppColor.white,
                          err: 'please enter password',
                          label: 'Password',
                          textInputType: TextInputType.text,
                          controller: passwordController,
                          isValidationError: _isPassword,
                          textCallBack: (_) => setState(() => _isPassword = false),),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(right:16),
                          child: InkWell(
                            onTap: (){},
                            child: TextViewWidget(
                                text: 'Forgot Password',
                                textAlign: TextAlign.right,
                                color: AppColor.white,
                                fontWeight: FontWeight.w500,
                                textSize: 18),
                          ),
                        ),
                        SizedBox(height: 35,),

                        model.isLoading?
                        SpinKitCircle(
                          itemBuilder: (BuildContext context, int index) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                  color: index.isEven ? AppColor.white : AppColor.purple,
                                  shape: BoxShape.circle),
                            );
                          },
                        ):Center(
                          child: ElevatedButton(
                            onPressed: ()=>signIn(),
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
                        SizedBox(height: 20,),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              text: 'Not a Member?--> ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w500),
                              children: <TextSpan>[
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () =>
                                        PageRouter.gotoNamed(Routes.SIGN_UP, context),
                                  text: 'Sign up',
                                  style: TextStyle(
                                      fontSize: 20,
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
