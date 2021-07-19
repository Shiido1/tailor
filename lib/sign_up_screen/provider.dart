import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/network_exceptions.dart';
import 'package:sizary/instance_helper/instances.dart';
import 'package:sizary/otp/otp_screen.dart';
import 'package:sizary/sign_up_screen/repo.dart';
import 'package:sizary/utils/page_route/navigator.dart';
import 'package:sizary/widget/progress.dart';

import 'model.dart';

final SignUpApiRepository _repository = SignUpApiRepository();

class SignUpProviders extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;
  SignUpModel model;

  void init(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void signUp({@required Map map}) async {
    try {
      _progressIndicator.show();
      final _response = await _repository.signUp(data: map);
       _response.when(success: (success, _, message) async {
        await _progressIndicator.dismiss();
          showToast(this._context, message: 'SignUp Successful.');
        PageRouter.gotoWidget(
            OtpPage(),
            _context);
        notifyListeners();
      }, failure: (NetworkExceptions error, int statusCode,
          String statusMessage) async {
         await _progressIndicator.dismiss().then((value) => showToast(
             this._context, message: NetworkExceptions.getErrorMessage(error)));
        notifyListeners();
      });
    } catch (e) {
      await _progressIndicator.dismiss().then((value) => showToast(
          this._context, message: 'Sign Up failed'));
      notifyListeners();
    }
  }
}


