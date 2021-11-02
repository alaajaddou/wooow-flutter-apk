import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart' show GoogleSignIn, GoogleSignInAccount, GoogleSignInAuthentication;

class Authentication {
  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  User? userDetails;


  handleUser(User? user) {
    if (user != null) {
      userDetails = user;
    }
  }

  createWithCredentials(String email, String password) async {
    try {
      userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
    } catch (e) {
      print(e);
    }
  }

  loginWithCredentials(String email, String password) async {
    // try {
    //   UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(
    //       email: email,
    //       password: password
    //   );
    //   print('after');
    //   print(userCredential);
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     print('The password provided is too weak.');
    //   } else if (e.code == 'email-already-in-use') {
    //     print('The account already exists for that email.');
    //   }
    // } catch (e) {
    //   print(e);
    // }
  }

  void runListeners() {
    auth.userChanges().listen((User? user) {
      print('userChanges =>');
      handleUser(user);
    });

    auth.idTokenChanges().listen((User? user) {
      print('idTokenChanges =>');
      handleUser(user);
    });

    auth.authStateChanges().listen((User? user) {
      print('authStateChanges =>');
      handleUser(user);
    });
  }

  User? getUser() {
    return userDetails;
  }

  Future<UserCredential> signInWithGoogle() async {
    // create google sign in opject.
    GoogleSignIn _googleSignIn = GoogleSignIn();

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signUpWithGoogle() async {
    // create google sign in opject.
    GoogleSignIn _googleSignIn = GoogleSignIn();

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    print(credential);

    // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCustomToken(credential.accessToken ?? '');
  }

  Authentication() {
    runListeners();
  }
}