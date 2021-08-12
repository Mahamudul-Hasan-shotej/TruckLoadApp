import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:truck_load_demo/Models/Services/api_exceptions.dart';
import 'package:truck_load_demo/ViewModel/CustomerInfodata.dart';
import 'dart:async';

import 'dart:io';

import 'package:truck_load_demo/ViewModel/DashboardOne.dart';
import 'package:truck_load_demo/ViewModel/DashboardTwo.dart';
import 'package:truck_load_demo/ViewModel/OrderHistoryModel.dart';
import 'package:truck_load_demo/ViewModel/OrderFormData.dart';
import 'package:truck_load_demo/ViewModel/OrderInfo.dart';

String url = 'https://api.truckload.trukiot.com/v1';
DashBoardOne resOne = DashBoardOne();
DashBoardtwo resTwo = DashBoardtwo();
Orderformdata resthree = Orderformdata();

CustomerInfodata resfour = CustomerInfodata();
OrderData resfive = OrderData();
OrderInfo resorderinfo = OrderInfo();

class AdditionalDataService {
  static final AdditionalDataService _singleton = AdditionalDataService();
  static AdditionalDataService get instance => _singleton;

  Future<dynamic> fetchDashboardOneData(String pk) async {
    var responseJson;
    //https://api.truckload.trukiot.com/v1/g/c/trip?sk=01878787899_bat2_customer
    try {
      var url1 = Uri.parse("$url/g/c/trip?sk=$pk");
      final response = await http.get(url1);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  //https://api.truckload.trukiot.com/v1/s/c/trip?sk=$pk
  static Future fetchDatatwo(String pk) async {
    var url1 = Uri.parse("$url/s/c/trip?sk=$pk");
    final response = await http.get(url1);
    if (response.statusCode == 200) {
      resTwo = dashBoardtwoFromJson(response.body);
      return resTwo;
    }
  }
  //https://api.truckload.trukiot.com/v1/all?orientation=customer&email=bata2@gmail.com

  static Future fetchClientInfo(String mail) async {
    var url1 = Uri.parse("$url/all?orientation=customer&email=$mail");
    final response = await http.get(url1);
    if (response.statusCode == 200) {
      resfour = customerInfodataFromJson(response.body);
      return resfour;
    }
  }

  //'https://api.truckload.trukiot.com/v8/object?pk=1614489805683_lgri_order&sk=lease
  Future<dynamic> fetchOrder(String pk) async {
    var responseJson;
    try {
      var url1 = Uri.parse(
          "https://api.truckload.trukiot.com/v1/customer/orders?sk=$pk");
      final response = await http.get(url1);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> fetchOrderinfo(String pk) async {
    var responseJson;
    try {
      var url1 = Uri.parse(
          "https://api.truckload.trukiot.com/v1/truck-status?order_id=$pk");
      final response = await http.get(url1);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  static Future<http.Response> createOrder(var data) async {
    var url1 = Uri.parse("$url/order");
    final response = await http.post(url1,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: orderformdataToJson(data));
    if (response.statusCode == 200) {
      //resthree = orderformdataFromJson(response.body);
      return response;
    }
    return null;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        // var responseJson = json.decode(response.body.toString());
        return response;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
