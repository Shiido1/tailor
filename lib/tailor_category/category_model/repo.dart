import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sizary/error_handler/handler.dart';
import 'package:sizary/instance_helper/instances.dart';
import 'model.dart';

class TailorCategoryRepo{
  Future<dynamic> tailorCategoryRepo(
      {@required String queryToken}) async{

    List<Category> categoryList = [];
    try {

      final response =
      await tailorNetworkClient.makeGetRequest('category?token=$queryToken');
      String responseString = response.toString();
      var decodedData = jsonDecode(responseString);
      List<dynamic> mapUser = decodedData['category'];
      categoryList.clear();
      for (int i = 0; i < mapUser.length; i++) {
        Category category = Category(
          categoryName: mapUser[i]['category_name'],
          image: mapUser[i]['image']
        );
        categoryList.add(category);
      }
      return categoryList;
    } catch (e) {
      return handleNetworkException(e);
    }
  }
}