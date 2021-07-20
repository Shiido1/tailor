import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/network_exceptions.dart';
import 'package:sizary/complete_tailor_verification/repo.dart';
import 'package:sizary/instance_helper/instances.dart';
import 'package:sizary/utils/page_route/navigator.dart';
import 'package:sizary/utils/page_route/route.dart';
import 'package:sizary/widget/progress.dart';

CompleteTailorRepo _completeTailorRepo = CompleteTailorRepo();

class CompleteTailorAccountProvider extends ChangeNotifier {
  BuildContext _context;
  CustomProgressIndicator _progressIndicator;
  String queryToken;
  String errorMsg = 'Please try again';

  void init(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void verifyTailorAccount({@required FormData map,String token}) async {
    try {
      // print('print me inside tailor gang $token');
      print('print me inside tailor gang $map');
      _progressIndicator.show();

      final _response = await _completeTailorRepo.completeTailorAccount(
          queryToken: token,map: map);
      // final _response =
      //     await _completeTailorRepo.completeTailorVerification(map: map);
      print('print me with response $_response');
      print('print me with response ${_response.statusMessage}');
      print('print me with response ${_response.statusCode}');
      _response.when(success: (success, data, __) async {
        await _progressIndicator.dismiss();
        print('print me inside tailor squad');
        showToast(this._context, message: success.message);
        PageRouter.gotoNamed(Routes.TAILOR_DASHBOARD_SCREEN, _context);
        notifyListeners();
      }, failure: (NetworkExceptions error, _, statusMessage) {
         _progressIndicator.dismiss();
         if(error.toString()=='NetworkExceptions.noInternetConnection()'){
           errorMsg = 'check internet connection and try again';
           showToast(this._context, message: errorMsg);
           notifyListeners();
         }else{
           showToast(this._context,
               message: NetworkExceptions.getErrorMessage(error));
           _progressIndicator.dismiss();
           notifyListeners();
         }
      });
      notifyListeners();
    } catch (e) {
       await _progressIndicator.dismiss();
      notifyListeners();
      print('print catch error here');
      showToast(this._context, message: 'Failed.. Please try again');
    }
  }
}
