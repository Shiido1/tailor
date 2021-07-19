import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/api_result.dart';
import 'package:sizary/error_handler/handler.dart';
import 'package:sizary/instance_helper/instances.dart';
import 'package:sizary/sign_in_screen/provider.dart';
import 'model.dart';


class LoginApiRepository {
  SignInProvider signInProvider;
  Future<ApiResponse<dynamic>> loginUser({@required BuildContext context,@required Map map}) async {
    try {

      final _response =
      await networkClient.makePostRequest('login', data: map);
      final _finalData = LoginModel.fromJson(_response.data);
      preferencesHelper.saveValue(key: 'firstname', value: _finalData.details.user.firstname);
      preferencesHelper.saveValue(key: 'lastname', value: _finalData.details.user.lastname);
      preferencesHelper.saveValue(key: 'email', value: _finalData.details.user.email);
      preferencesHelper.saveValue(key: 'verified', value: _finalData.details.user.verified);
      preferencesHelper.saveValue(key: 'login_token', value: _finalData.details.accessToken);
      preferencesHelper.saveValue(key: 'login_type', value: _finalData.details.user.type);
        return ApiResponse.success(
            statusMessage: _response.statusMessage,
            data: _finalData,
            statusCode: _response.statusCode);
    } catch (e) {
      return handleNetworkException(e);
    }
  }
}