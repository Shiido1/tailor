import 'package:flutter/cupertino.dart';
import 'package:tailor_app/tailor_category/tailor_category_screen.dart';

BuildContext globalContext;
bool hasOpenedLogOutDialog = false;

class Routes {
  static const String DASHBOARD = '/dashboard';
  // static const String OTP_SUCCESSFUL = '/otpSuccessful';
  // static const String LOGIN = '/login';
  // static const String SIGNUP = '/signup';
  // static const String PLAYLIST = '/playlist';
  // static const String SONGSCREEN = '/song_screen';
  // static const String CHANGEPASSWORD = '/change_password';

  static Map<String, Widget Function(BuildContext mainContext)> get getRoutes =>
      {
        DASHBOARD: (BuildContext context) {
          globalContext = context;
          return TailorCategory();
        },
        // PLAYLIST: (BuildContext context) {
        //   globalContext = context;
        //   return PlayList();
        // },
        // LOGIN: (BuildContext context) {
        //   globalContext = context;
        //   return SignInScreen();
        // },
        // SIGNUP: (BuildContext context) {
        //   globalContext = context;
        //   return SignUpScreen();
        // },
        // CHANGEPASSWORD: (BuildContext context) {
        //   globalContext = context;
        //   return ChangePassword();
        // },
      };
}