import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/utils/global.dart';

class GoogleSignInController extends ChangeNotifier {
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _googleAccount;

  login() async {
    _googleAccount = await _googleSignIn.signIn();
    dynamic loginData = {
      'name': _googleAccount!.displayName,
      'email': _googleAccount!.email,
      'avatar': _googleAccount!.photoUrl,
      'google_id': _googleAccount!.id,
      'password': '123456dummy'
    };
    final response = await ApiBaseHelper().post('login-by-google', loginData);
    dynamic user = response['user'];
    auth.loginByGoogle(user, loginData);
    notifyListeners();
  }

  logout() async {
    _googleAccount = await _googleSignIn.signOut();
    notifyListeners();
  }
}