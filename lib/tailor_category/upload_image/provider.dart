import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/network_exceptions.dart';
import 'package:sizary/instance_helper/instances.dart';
import 'package:sizary/tailor_category/upload_image/repo.dart';
import 'package:sizary/widget/progress.dart';


UploadImageRepo uploadImageRepo = UploadImageRepo();

class UploadImageProvider extends ChangeNotifier{

  BuildContext _context;
  CustomProgressIndicator _progressIndicator;
  String queryToken;
  String errorMsg = 'Please try again';

  void init(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomProgressIndicator(this._context);
  }

  void uploadImage({@required FormData imageData, String token}) async{

    try{
      _progressIndicator.show();
      final _response = await uploadImageRepo.uploadImage(
          queryToken:token,imageData:imageData);
      _response.when(success: (success, data, __) async {
        await _progressIndicator.dismiss();
        showToast(this._context, message: success.message);
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