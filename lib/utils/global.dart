import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/models/user.dart';

class Global {
  static const baseUrl = "vmi561267.contaboserver.net";
  static const apiPath = "api/";

  static int cartCount = 0;
}

class ApiBaseHelper {
  Future<dynamic> get(String url) async {
    try {
      var api = Uri.http(Global.baseUrl, Global.apiPath + url);
      var headers = await getHeaders() as Map<String, String>;
      final response = await http.get(api, headers: headers);
      return _returnResponse(response);
    } on SocketException catch (exception) {
      throw FetchDataException('No Internet connection' + exception.message);
    }
  }

  Future<dynamic> post(String url, dynamic body) async {
    try {
      var api = Uri.http(Global.baseUrl, Global.apiPath + url);
      var headers = await getHeaders() as Map<String, String>;
      Response response = await http.post(api, body: jsonEncode(body), headers: headers);
      return _returnResponse(response);
    } catch (exception) {
      rethrow;
    }
  }

  dynamic _returnResponse(http.Response response) {
    // debugPrint(response.statusCode.toString());
    // debugPrint(response.body.toString());
    switch (response.statusCode) {
      case 200:
      case 201:
      case 400:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  getHeaders() async {
    var headers = {HttpHeaders.contentTypeHeader: 'application/json', HttpHeaders.acceptHeader: 'application/json'};

    User? user = await auth.getUser();
    if (user != null) {
      print(user.token);
      headers[HttpHeaders.authorizationHeader] = 'Bearer ' + user.token;
    }

    return headers;
  }
}

class AppException implements Exception {
  final dynamic _message;
  final dynamic _prefix;

  AppException([this._message, this._prefix]);

  @override
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
  var formattedNumber = NumberFormat.simpleCurrency(locale: "en_US", name: ' ils ', decimalDigits: 2);
  return formattedNumber.format(amount);
  // final oCcy = NumberFormat("#,##.##", "he-IL");
  // oCcy.decimalDigits(2);
  // return oCcy.currencySymbol + ' ' + oCcy.format(amount).toString();
}

ButtonStyle getButtonStyle() {
  return ElevatedButton.styleFrom(
    primary: getPrimaryColor(),
    textStyle: const TextStyle(fontSize: 16),
    padding: const EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
  );
}

ButtonStyle getViewButtonStyle() {
  return ElevatedButton.styleFrom(
    onPrimary: getPrimaryColor(),
    primary: getPrimaryColor(),
    textStyle: const TextStyle(fontSize: 12),
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
  );
}

ButtonStyle getTransparentButtonStyle() {
  return ElevatedButton.styleFrom(
    primary: getTransparentColor(),
    textStyle: const TextStyle(fontSize: 16),
    padding: const EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
  );
}

Color getPrimaryColor() {
  return Colors.lightGreen.shade300;
}

Color getTransparentColor() {
  return Colors.transparent;
}

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

dynamic convertDataToDynamic(authResponseData) {
  final String tempData = authResponseData.toString();
  return jsonDecode(tempData);
}
