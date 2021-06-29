import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tailor_app/tailor_category/upload_image/repo.dart';
import 'package:tailor_app/widget/progress.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/network_exceptions.dart';
import 'package:tailor_app/instance_helper/instances.dart';


UploadImageRepo uploadImageRepo = UploadImageRepo();

class UploadImageProvider extends ChangeNotifier{

  BuildContext _context;
  CustomProgressIndicator _progressIndicator;
  String queryToken;

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
        print('print me inside upload');
        showToast(this._context, message: success.message);
        notifyListeners();
      }, failure: (NetworkExceptions error, _, statusMessage) {
        _progressIndicator.dismiss();
        showToast(this._context,
            message: NetworkExceptions.getErrorMessage(error));
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