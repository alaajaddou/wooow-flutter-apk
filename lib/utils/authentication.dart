import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/models/address.dart';
import 'package:wooow_supermarket/models/user.dart';
import 'package:wooow_supermarket/utils/global.dart';

class Authentication {
  late User _user;

  User get user => _user;

  set user(User user) {
    _user = user;
  }
  Address _address = Address(
    isDefault: false,
    userId: 0,
    deletable: false,
    id: 0
  );

  Address get address => _address;

  set address(Address address) {
    _address = address;
  }

  List<Address> addresses = [];

  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool isAuthenticated) {
    _isAuthenticated = isAuthenticated;
  }

  Authentication() {
    //
  }

  setGuestUser() {
    user = User(
      id: 0,
      addressId: 0,
      email: 'example@example.com',
      imagePath: 'users/default.png',
      name: 'Guest',
      token: '',
      loginProvider: ''
    );
    isAuthenticated = false;
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
    return await ApiBaseHelper().post('create-user', data);
  }

  Future<User?> login(String? email, String? password) async {
    try {
      dynamic tempUser = await ApiBaseHelper().post('login', {'email': email, 'password': password});
      return handleUserAfterLogin(tempUser, 'email', {'email': email, 'password': password});
    } catch (e) {
      print(e.toString());
    }
  }

  Future<User?> loginByGoogle(dynamic tempUser, data) async {
    try {
      return handleUserAfterLogin(tempUser, 'google', data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future logout() async {
    Database db = await openDataBase();
    await db.delete('activeUserId', where: 'id = 1');
    isAuthenticated = false;
    setGuestUser();
    await ApiBaseHelper().post('logout', {});
  }

  User prepareUser(dynamic tempUser, String provider) {
    User user = User(
        name: tempUser['name'],
        imagePath: tempUser['avatar'],
        loginProvider: provider,
        addressId: tempUser['addressId'],
        token: tempUser['api_token'],
        email: tempUser['email'],
        id: tempUser['id']);
    isAuthenticated = true;
    this.user = user;
    return user;
  }

  User getUserInstance(userMap) {
    User user = User(
        name: userMap['name'],
        imagePath: userMap['imagePath'],
        id: userMap['id'],
        token: userMap['token'],
        email: userMap['email'],
        addressId: userMap['addressId']
    );

    // if (userMap['addressId'] != null) {
    //   user.addressId = userMap['addressId'];
    // }

    if (userMap['loginProvider'] != null) {
      user.loginProvider = userMap['loginProvider'];
    }
    return user;
  }

  Future<User?> handleUserAfterLogin(tempUser, String provider, data) async {
    User user = prepareUser(tempUser, provider);
    Database db = await openDataBase();
    List<Map> activeUsers = await db.rawQuery('SELECT * FROM activeUserId');
    if (activeUsers.isNotEmpty) {
      await db.update('activeUserId', {'id': 1, 'email': data['email'], 'password': data['password'], 'provider': provider, 'google_id': data['google_id'], 'facebook_id': data['facebook_id']});
      await db.update('users', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
    } else {
      await db.insert('activeUserId', {'id': 1, 'email': data['email'], 'password': data['password'], 'provider': provider, 'google_id': data['google_id'], 'facebook_id': data['facebook_id']});
      await db.insert('users', user.toMap());
    }
    isAuthenticated = true;
    this.user = user;
    return user;
  }
}
