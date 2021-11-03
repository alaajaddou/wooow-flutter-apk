import 'package:flutter/material.dart';
import 'package:wooow_supermarket/utils/global.dart';

class Authentication {

  Authentication() {
    //
  }

  Future<void> createWithCredentials(dynamic data) async {
    var createUserResponse = await ApiBaseHelper().post('create-user', data);
    debugPrint(createUserResponse.body.toString());
  }

  getUser() {}
}