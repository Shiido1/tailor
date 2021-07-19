
import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/api_result.dart';
import 'package:sizary/error_handler/handler.dart';
import 'package:sizary/instance_helper/instances.dart';

import 'model.dart';

class OtpApiRepository {
  Future<dynamic> verify({@required String queryToken,@required Map data}) async {
    final token = {
      'token': queryToken
    };
    try {
      final response =
      await networkClient.makePostRequest("verify",
          data: data,queryParameters:token);
      final _finalData = OtpModel.fromJson(response.data);
      preferencesHelper.saveValue(key: 'type', value: _finalData.user.type);
      print('${_finalData.user.email}');
      print('${_finalData.user.firstname}');
      print('${_finalData.user.type}');
      print('verify me');
      print('printing $response');
      return ApiResponse.success(
          statusCode: response.statusCode,
          data: _finalData,
          statusMessage: response.statusMessage);
    } catch (e) {
      return handleNetworkException(e);
    }
  }

  Future<ApiResponse<OtpModel>> resend({String queryToken,@required Map data}) async {
    final token = {
      'token': queryToken
    };
    try {
      final response = await networkClient.makePostRequest("verify",
          data: data,queryParameters:token);
      return ApiResponse.success(data: OtpModel.fromJson(response.data));
    } catch (e) {
      return handleNetworkException(e);
    }
  }
}