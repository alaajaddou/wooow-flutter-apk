import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:intl/intl.dart';

class Global {
  static const baseUrl = "vmi561267.contaboserver.net";
  static const apiPath = "api/";
}

class ApiBaseHelper {

  Future<dynamic> get(String url) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      var client = http.Client();
      var api = Uri.http(Global.baseUrl, Global.apiPath + url);
      final response = await client.get(api);
      responseJson = _returnResponse(response);
    } on SocketException catch (exception) {
      print(exception);
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

String getFormattedCurrency(double amount) {
  final oCcy = NumberFormat("#,##0.00", "he-IL");
  return oCcy.currencySymbol + ' ' + oCcy.format(amount).toString();
}