import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/network_exceptions.dart';
import 'package:sizary/instance_helper/instances.dart';
import 'package:sizary/otp/repo.dart';
import 'package:sizary/utils/helper/timer_helper.dart';
import 'package:sizary/utils/page_route/navigator.dart';
import 'package:sizary/utils/page_route/route.dart';
import 'package:sizary/widget/progress.dart';
import 'model.dart';

OtpApiRepository _repository = OtpApiRepository();

class OtpProviders extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;

  void init(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void verifyOtp({@required String token,@required Map map}) async {
    try {
      _progressIndicator.show();

      final _response = await _repository.verify(data:map,queryToken: token);
      print('jkfjkjkfjk');
      print('jkfjkjkfjk $_response');
      _response.when(success: (success, data, __) async {
        await _progressIndicator.dismiss();
        showToast(this._context, message: success.message);
        String _prefType = await preferencesHelper.getStringValues(key: 'type');
        print('printing account type here $_prefType');
        if(_prefType != null && _prefType == 'client')
          PageRouter.gotoNamed(Routes.CLIENT_DASHBOARD_SCREEN, _context);
        else
        PageRouter.gotoNamed(Routes.TAILOR_OTP_SUCCESSFUL, _context);
        notifyListeners();
      }, failure: (NetworkExceptions error, _, statusMessage) {
        _progressIndicator.dismiss();
        showToast(this._context,
            message: NetworkExceptions.getErrorMessage(error));
      });
      notifyListeners();
    } catch (e) {
      _progressIndicator.dismiss();
      debugPrint('Error: $e');
    }
  }

  void resendOtp(UtilityProvider utilityProvider,{@required String token,@required Map map}) async {
    try {
      _progressIndicator.show();
      final _response = await _repository.verify(data: map,queryToken: token);
      _response.when(success: (OtpModel success, data, __) async {
        await _progressIndicator.dismiss();
        showToast(this._context, message: success.message);
        print('resend successful');
        utilityProvider.startTimer(timeLimit: 4);
        String _prefType = await preferencesHelper.getStringValues(key: 'type');
        print('printing account type here $_prefType');
        if(_prefType != null && _prefType == 'client')
          // PageRouter.gotoNamed(Routes.CLIENT_DASHBOARD, _context);
          showToast(this._context, message: 'success buh no screen for now');
        else
          PageRouter.gotoNamed(Routes.TAILOR_OTP_SUCCESSFUL, _context);
        notifyListeners();
      }, failure: (NetworkExceptions error, _, statusMessage) {
        _progressIndicator.dismiss();
        showToast(this._context,
            message: NetworkExceptions.getErrorMessage(error));
      });
      notifyListeners();
    } catch (e) {
      _progressIndicator.dismiss();
      debugPrint('Error: $e');
    }
  }
}