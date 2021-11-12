import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' show Database, getDatabasesPath, openDatabase;
import 'package:wooow_supermarket/utils/authentication.dart';
import 'package:wooow_supermarket/utils/route_generator.dart';

FlutterCart cart = FlutterCart();
int cartCount = cart.getCartItemCount();
Authentication auth = Authentication();
GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'https://www.googleapis.com/auth/userinfo.email',
    'https://www.googleapis.com/auth/userinfo.profile',
  ],
);

void initializeDataBase() async {
  database = await openDatabase(
    join(await getDatabasesPath(), 'wooow_supermarket.db'),
    onCreate: (db, version) => _createTables(db, version),
    onOpen: (db) => _prepareData(db),
    version: 1,
  );
}

Future<void> signInWithGoogle() async {
  try {
    await _googleSignIn.signIn();
  } catch (error) {
    //
  }
}

String userSqlCreateQuery = 'CREATE TABLE users(id INTEGER PRIMARY KEY, addressId INTEGER, name TEXT, email TEXT, imagePath TEXT, loginProvider TEXT, token TEXT)';
String categorySqlCreateQuery = 'CREATE TABLE categories(id INTEGER PRIMARY KEY, parent INTEGER, name TEXT, imagePath TEXT)';
String itemSqlCreateQuery = 'CREATE TABLE items(id INTEGER PRIMARY KEY, categoryId INTEGER, availableQuantity INTEGER, price TEXT, discount TEXT, name TEXT, imagePath TEXT, description TEXT, discountFrom TEXT, discountTo TEXT)';
String addressSqlCreateQuery = 'CREATE TABLE addresses(id INTEGER PRIMARY KEY, userId INTEGER, city TEXT, village TEXT, phone TEXT, mobile TEXT, address TEXT, building TEXT)';
String notificationSqlCreateQuery = 'CREATE TABLE notifications(id INTEGER PRIMARY KEY, title TEXT, body TEXT, isShown INTEGER)';
String orderStatusSqlCreateQuery = 'CREATE TABLE orderStatuses(id INTEGER PRIMARY KEY, name TEXT)';
String orderSqlCreateQuery = 'CREATE TABLE orders(id INTEGER PRIMARY KEY, userId INTEGER, addressId INTEGER, orderStatusId INTEGER)';
String cartItemSqlCreateQuery = 'CREATE TABLE cartItems(id INTEGER PRIMARY KEY, userId INTEGER, productId INTEGER, orderId INTEGER)';
String activeUserIdSqlCreateQuery = 'CREATE TABLE activeUserId(id INTEGER PRIMARY KEY, userId INTEGER)';

void _createTables(db, version) {
  db.execute(userSqlCreateQuery);
  db.execute(categorySqlCreateQuery);
  db.execute(itemSqlCreateQuery);
  db.execute(addressSqlCreateQuery);
  db.execute(notificationSqlCreateQuery);
  db.execute(orderStatusSqlCreateQuery);
  db.execute(orderSqlCreateQuery);
  db.execute(cartItemSqlCreateQuery);
  db.execute(activeUserIdSqlCreateQuery);
}

void _prepareData(db) {}

Database? database;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDataBase();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {}
    });
    _googleSignIn.signInSilently();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    initializeDataBase();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      initialRoute: '',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
