import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:sizary/utils/helper/helper.dart';

class CompleteTailorModel {
  String message;

  CompleteTailorModel({this.message});

  CompleteTailorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }

  static Future<FormData> completeToTailorMap({
    // @required String token,
    @required String shopName,
    @required String cac,
    @required String shopAddress,
    @required String phone,
    @required String state,
    @required String tags,
    @required String address,
    @required String fabrics,
    @required File logo,
  }) async {
    var byteData = logo.absolute;
    var imageData = byteData.readAsBytesSync();
    MultipartFile multipartFile = new MultipartFile.fromBytes(
      imageData,
      filename: generateKey(15),
      contentType: MediaType("image", "jpg"),
    );

    FormData formData = FormData.fromMap({
      'shopname': shopName,
      'cac': cac,
      'shopaddress': shopAddress,
      'phone': phone,
      'state': state,
      'tags': tags,
      'address': address,
      'fabrics': fabrics,
      'logo': multipartFile,
    });
    return formData;
  }
}
