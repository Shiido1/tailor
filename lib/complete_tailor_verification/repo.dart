import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/api_result.dart';
import 'package:dio/dio.dart';
import 'package:sizary/error_handler/handler.dart';
import 'package:sizary/instance_helper/instances.dart';

import 'model.dart';

class CompleteTailorRepo {
  Future<ApiResponse<dynamic>> completeTailorAccount(
      {@required FormData map, @required String queryToken}) async {
    print('print query token repo:$queryToken');
    print('print formData map repo:$map');
    try {

      final response = await networkClient.makePostRequest(
          "complete?token=$queryToken", data: map);
      print('printing boomba $response');
      print('booomba formData $map');
      final _finalData = CompleteTailorModel.fromJson(response.data);
      print('printing final data $_finalData');
      print("printint the final data:${_finalData.message}");
      return ApiResponse.success(
          statusCode: response.statusCode,
          data: _finalData,
          statusMessage: response.statusMessage);
    } catch (e) {
      return handleNetworkException(e);
    }
  }
}
