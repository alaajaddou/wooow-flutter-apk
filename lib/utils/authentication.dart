import 'package:wooow_supermarket/utils/global.dart';

class Authentication {
  Authentication() {
    //
  }

  dynamic createWithCredentials(dynamic data) async {
    dynamic registeredUser = await ApiBaseHelper().post('create-user', data);
    return registeredUser;
  }

  getUser() {}
}
