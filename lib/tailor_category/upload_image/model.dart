import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:sizary/utils/helper/helper.dart';

class UploadImageModel {
  String message;
  String verified;

  UploadImageModel({this.message, this.verified});

  UploadImageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    verified = json['verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['verified'] = this.verified;
    return data;
  }

  static Future<FormData> uploadImageToMap({
    @required File image,
  }) async {
    var byteData = image.absolute;
    var imageData = byteData.readAsBytesSync();
    MultipartFile multipartFile = new MultipartFile.fromBytes(
      imageData,
      filename: generateKey(15),
      contentType: MediaType("image","jpg"),
    );

    FormData formData = FormData.fromMap({
      'image':multipartFile,

    });
    return formData;
  }
}