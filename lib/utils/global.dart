import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:intl/intl.dart';

class Global {
  static const baseUrl = "vmi561267.contaboserver.net";
  static const apiPath = "api/";

  static int cartCount = 0;
}

class ApiBaseHelper {
  Future<dynamic> get(String url) async {
      debugPrint('Api GET, url $url');
      late var responseJson = '';
      try {
        var client = http.Client();
        var api = Uri.http(Global.baseUrl, Global.apiPath + url);
        final response = await client.get(api);
        responseJson = _returnResponse(response);
      } on SocketException catch (exception) {
        throw FetchDataException('No Internet connection' + exception.message);
      }
      return responseJson;
    }

  Future<dynamic> post(String url, Object body) async {
    debugPrint('Api Post, url $url');

    try {
      var client = http.Client();
      var api = Uri.http(Global.baseUrl, Global.apiPath + url);
      final response = await client.post(api, body: body);
      debugPrint('Api GET, received');
      return response;
    } catch (exception) {
      rethrow;
    }
  }

  dynamic _returnResponse(http.Response response) {
    debugPrint(response.statusCode.toString());
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
        throw FetchDataException('Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
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
  final oCcy = NumberFormat("#,##0.00", "he-IL");
  return oCcy.currencySymbol + ' ' + oCcy.format(amount).toString();
}

ButtonStyle getButtonStyle() {
  return ElevatedButton.styleFrom(
    primary: getPrimaryColor(),
    textStyle: const TextStyle(fontSize: 16),
    padding: const EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
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