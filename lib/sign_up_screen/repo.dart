import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/api_result.dart';
import 'package:tailor_app/error_handler/handler.dart';
import 'package:tailor_app/instance_helper/instances.dart';

import 'model.dart';

class SignUpApiRepository {
  Future<dynamic> signUp({@required Map data}) async {
    try {
      print('inside here');
      final _response =
      await networkClient.makePostRequest('register', data: data);
      print('ioofefpoeoe');
      print('print:$_response');
      final _finalData = SignUpModel.fromJson(_response.data);
      preferencesHelper.saveValue(key: 'token', value: _finalData.user.accessToken);
     return ApiResponse.success(
        statusMessage: _response.statusMessage,
        data: _finalData,
        statusCode: _response.statusCode);
    } catch (e) {
      return handleNetworkException(e);
    }
  }
}
