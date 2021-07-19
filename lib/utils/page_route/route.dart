import 'package:flutter/cupertino.dart';
import 'package:sizary/complete_tailor_verification/complete_tailor_screen.dart';
import 'package:sizary/dashboard/client_dashboard_screen.dart';
import 'package:sizary/dashboard/tailor_dashboard_screen.dart';
import 'package:sizary/sign_in_screen/sign_in.dart';
import 'package:sizary/sign_up_screen/sing_up_screen.dart';
import 'package:sizary/tailor_category/tailor_category_screen.dart';

BuildContext globalContext;
bool hasOpenedLogOutDialog = false;

class Routes {
  static const String TAILOR_CATEGORY = '/tailorCategory';
  static const String TAILOR_OTP_SUCCESSFUL = '/tailorOtpSuccessful';
  static const String TAILOR_DASHBOARD_SCREEN = '/tailorDashboard';
  static const String CLIENT_DASHBOARD_SCREEN = '/clientDashboard';
  static const String LOGIN = '/login';
  static const String SIGN_UP = '/signup';
  // static const String CHANGEPASSWORD = '/change_password';

  static Map<String, Widget Function(BuildContext mainContext)> get getRoutes =>
      {
        TAILOR_CATEGORY: (BuildContext context) {
          globalContext = context;
          return TailorCategory();
        },
        TAILOR_OTP_SUCCESSFUL: (BuildContext context) {
          globalContext = context;
          return CompleteTailorScreen();
        },

        LOGIN: (BuildContext context) {
          globalContext = context;
          return SignInScreen();
        },
        SIGN_UP: (BuildContext context) {
          globalContext = context;
          return SignUpScreen();
        },
        TAILOR_DASHBOARD_SCREEN: (BuildContext context) {
          globalContext = context;
          return TailorDashBoard();
        },
        CLIENT_DASHBOARD_SCREEN: (BuildContext context) {
          globalContext = context;
          return ClientDashboard();
        },
        // CHANGEPASSWORD: (BuildContext context) {
        //   globalContext = context;
        //   return ChangePassword();
        // },
      };
}