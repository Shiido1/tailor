import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizary/error_handler/handler.dart';
import 'package:sizary/instance_helper/instances.dart';

import 'model.dart';

class CustomerRepo{
  Future<dynamic> customersRepo({@required String queryToken}) async{

    List<Customers> customersList = [];
    try {

      final response =
      await tailorNetworkClient.makeGetRequest('customers?token=$queryToken');
      String responseString = response.toString();
      var decodedData = jsonDecode(responseString);
      List<dynamic> mapUser = decodedData['customers'];
      customersList.clear();
      for (int i = 0; i < mapUser.length; i++) {
        Customers customers = Customers(
            customerName: mapUser[i]['customer_name'],
            totalorder: mapUser[i]['totalorder'],
            totalpayment: mapUser[i]['totalpayment'],
            pendingpayment: mapUser[i]['pendingpayment']

        );
        customersList.add(customers);
      }
      return customersList;
    } catch (e) {
      return handleNetworkException(e);
    }
  }
}