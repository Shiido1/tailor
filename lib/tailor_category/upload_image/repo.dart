import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/api_result.dart';
import 'package:tailor_app/tailor_category/upload_image/model.dart';
import 'package:tailor_app/error_handler/handler.dart';
import 'package:tailor_app/instance_helper/instances.dart';
import 'package:dio/dio.dart';


class UploadImageRepo {
  Future<ApiResponse<dynamic>> uploadImage(
      {@required FormData imageData, @required String queryToken}) async {
    print('print query token repo:$queryToken');

    try {
      print('print formData map image repo');
      final response =
      await networkClient.makePostRequest(
          "uploadshopimages?token=$queryToken&image=", data: imageData);
      print('printing image $response');

      final _finalData = UploadImageModel.fromJson(response.data);
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