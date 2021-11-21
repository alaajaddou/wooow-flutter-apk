import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/models/address.dart';
import 'package:wooow_supermarket/models/user.dart';
import 'package:wooow_supermarket/utils/global.dart';

class Authentication {
  User? user;
  Address address = Address(id: 0, userId: 0);

  Authentication() {
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
    return prepareUser(registeredUser, 'email');
  }

  Future<User?> getUser() async {
    if (user is User) {
      return user;
    }

    if (database!.isOpen) {
      List<dynamic> activeUsers = await database!.query('activeUserId', where: 'id = 1');
      if (activeUsers.isNotEmpty) {
        dynamic activeUser = activeUsers[0];
        var usersFromDb = await database!.query('users', where: 'id = ?', whereArgs: [activeUser['userId']]);
        if (usersFromDb.isNotEmpty) {
          user = getUserInstance(usersFromDb[0]);
          return user;
        }
      }
    }
    return null;
  }

  Future<User?> login(String? email, String? password) async {
    dynamic tempUser = await ApiBaseHelper().post('login', {'email': email, 'password': password});
    return prepareUser(tempUser, 'email');
  }

  Future logout() async {
    if (database!.isOpen) {
      await database!.delete('activeUserId', where: 'id = 1');
    }
    await ApiBaseHelper().post('logout', {});
  }

  Future<User?> prepareUser(dynamic tempUser, String provider) async {
    user = User(
        name: tempUser['name'],
        imagePath: tempUser['avatar'],
        loginProvider: provider,
        addressId: tempUser['addressId'],
        token: tempUser['api_token'],
        email: tempUser['email'],
        id: tempUser['id']);
    if (database!.isOpen) {
      List<Map> activeUsers = await database!.rawQuery('SELECT * FROM activeUserId');
      if (activeUsers.isNotEmpty) {
        await database!.update('activeUserId', {'id': 1, 'userId': user!.id});
        await database!.update('users', user!.toMap(), where: 'id = ?', whereArgs: [user!.id]);
      } else {
        await database!.insert('activeUserId', {'id': 1, 'userId': user!.id});
        await database!.insert('users', user!.toMap());
      }
    }
    return user;
  }

  User getUserInstance(userMap) {
    User user = User(name: userMap['name'], imagePath: userMap['imagePath'], id: userMap['id'], token: userMap['token'], email: userMap['email']);

    if (userMap['addressId'] != null) {
      user.addressId = userMap['addressId'];
    }

    if (userMap['loginProvider'] != null) {
      user.loginProvider = userMap['loginProvider'];
    }

    return user;
  }

  void setAddress() {
    ApiBaseHelper().get('address').then((address) {
      dynamic addressObj = address['address'];
      print('---------------------------------------');
      print(addressObj);
      print('---------------------------------------');
      this.address = Address(
        id: addressObj['id'],
        city: addressObj['city'],
        village: addressObj['village'],
        phone: addressObj['phone'],
        mobile: addressObj['mobile'],
        address: addressObj['address'],
        building: addressObj['building'],
        userId: addressObj['user_id'],
      );
    });
  }
}
