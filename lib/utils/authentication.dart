import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wooow_supermarket/models/user.dart';
import 'package:wooow_supermarket/utils/global.dart';

class Authentication {
  Authentication() {
    //
  }
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      print(googleSignInAuthentication);


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

  getUser() {}

  login(String? email, String? password) async {
    print('email');
    print(email);
    print('password');
    print(password);
    dynamic registeredUser = await ApiBaseHelper().post('login', {
      'email': email,
      'password': password
    });

    print(registeredUser);
    // return user;
  }
}
