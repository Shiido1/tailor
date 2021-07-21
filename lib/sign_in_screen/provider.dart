import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/network_exceptions.dart';
import 'package:sizary/instance_helper/instances.dart';
import 'package:sizary/sign_in_screen/repo.dart';
import 'package:sizary/utils/page_route/navigator.dart';
import 'package:sizary/utils/page_route/route.dart';

import 'model.dart';

LoginApiRepository _loginRepository = LoginApiRepository();

class SignInProvider extends ChangeNotifier {
  BuildContext _context;
  LoginModel loginModel;
  bool isLoading = false;
  String errorMsg = 'Login Failed,try again';

  void initialize(BuildContext context) {
    this._context = context;
  }

  void loginUser({@required BuildContext context,@required Map map}) async {
    try {
      isLoading = true;
      notifyListeners();
      final _response = await _loginRepository.loginUser(context: context,map: map);
      _response.when(success: (success, _, statusMessage) async {
        showToast(this._context, message: 'Login Successful.');
        isLoading = false;
        String _prefType = await preferencesHelper.getStringValues(key: 'login_type');
        if(_prefType != null && _prefType == 'client')
          PageRouter.gotoNamed(Routes.CLIENT_DASHBOARD_SCREEN, _context);
        else
          PageRouter.gotoNamed(Routes.TAILOR_DASHBOARD_SCREEN, _context);
        notifyListeners();
      }, failure: (NetworkExceptions error, _, statusMessage) async {
        isLoading = false;
        if(error.toString()=='NetworkExceptions.noInternetConnection()'){
          errorMsg = 'check internet connection and try again';
          showToast(this._context, message: errorMsg);
          notifyListeners();
        }else if(error.toString()=='NetworkExceptions.unauthorizedRequest()'){
          errorMsg = 'check email and password and try again';
          showToast(this._context, message: errorMsg);
          notifyListeners();
        }else{
          showToast(this._context,
              message: NetworkExceptions.getErrorMessage(error));
          isLoading = false;
          notifyListeners();
        }
      });
    } catch (e) {
      isLoading = false;
      showToast(_context, message: e);
      notifyListeners();
    }
  }
}

class AuthenticationProfile with ChangeNotifier {
  bool _isAuthentificated;
  BuildContext _context;

  void initialize(BuildContext context) {
    this._context = context;
    _isAuthentificated = false;
  }

  bool get isAuthentificated {
    return this._isAuthentificated;
  }

  set isAuthentificated(bool newVal) {
    this._isAuthentificated = newVal;
    this.notifyListeners();
  }

  logout(bool authentificated) {
    if(authentificated==true)
      print('print logout again');
      PageRouter.gotoNamed(Routes.LOGIN, _context);
    }
    notifyListeners();
  }


