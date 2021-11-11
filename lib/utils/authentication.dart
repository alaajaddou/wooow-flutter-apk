import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/models/user.dart';
import 'package:wooow_supermarket/utils/global.dart';

class Authentication {
  late User? user = null;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Authentication() {
    _prefs.then((SharedPreferences _preferences) {
      user = _preferences.get('user') as User?;
    });
    //
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      // final AuthCredential credential = GoogleAuthProvider.credential(
      //   accessToken: googleSignInAuthentication.accessToken,
      //   idToken: googleSignInAuthentication.idToken,
      // );
      //
      // try {
      //   final UserCredential userCredential =
      //   await auth.signInWithCredential(credential);
      //
      //   user = userCredential.user;
      // } on FirebaseAuthException catch (e) {
      //   if (e.code == 'account-exists-with-different-credential') {
      //     // handle the error here
      //   }
      //   else if (e.code == 'invalid-credential') {
      //     // handle the error here
      //   }
      // } catch (e) {
      //   // handle the error here
      // }
    }

    return user;
  }

  dynamic createWithCredentials(dynamic data) async {
    dynamic registeredUser = await ApiBaseHelper().post('create-user', data);
    return registeredUser;
  }

  Future<User?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('userId');
    if (userId != null) {
      if (database!.isOpen) {
        // ignore: unnecessary_null_comparison
        var userFromDb = await database!.query('users', where: 'id = ?', whereArgs: [userId]);
        print(userFromDb);
        return user;
      }
    }
    return null;
  }

  Future<User?> login(String? email, String? password) async {
    dynamic tempUser = await ApiBaseHelper().post('login', {'email': email, 'password': password});
    user = User(name: tempUser['name'], imagePath: tempUser['avatar'], loginProvider: 'email', addressId: tempUser['addressId'], token: tempUser['api_token'], email: tempUser['email'], id: tempUser['id']);
    if (database!.isOpen && user != null) {
      // ignore: unnecessary_null_comparison
      int userId = await database!.insert('users', user!.toMap());
      print(userId);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('userId', user!.id);
    }
    return user;
  }
}
