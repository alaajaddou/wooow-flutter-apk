import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_cart/model/cart_response_wrapper.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart' show Database, getDatabasesPath, openDatabase;
import 'package:sqflite/sqflite.dart';
import 'package:wooow_supermarket/models/GoogleSignInController.dart';
import 'package:wooow_supermarket/models/cart_class.dart';
import 'package:wooow_supermarket/models/cart_notifier.dart';
import 'package:wooow_supermarket/models/db_cart_item.dart';
import 'package:wooow_supermarket/models/item.dart';
import 'package:wooow_supermarket/models/user.dart';
import 'package:wooow_supermarket/pages/register_page.dart';
import 'package:wooow_supermarket/utils/alert.dart';
import 'package:wooow_supermarket/utils/authentication.dart';
import 'package:wooow_supermarket/utils/global.dart';
import 'package:wooow_supermarket/utils/notification_icon.dart';
import 'package:wooow_supermarket/utils/route_generator.dart';

FlutterCart cart = FlutterCart();
CartCounterClass cartClass = CartCounterClass(cart.getCartItemCount(), cart.getTotalAmount());
NotificationCounter notificationCounter = NotificationCounter(0);
CartNotifier cartNotifier = CartNotifier(cart.cartItem);
Authentication auth = Authentication();

void initializeDataBase() async {
}

String userSqlCreateQuery = 'CREATE TABLE users(id INTEGER PRIMARY KEY, addressId INTEGER, name TEXT, email TEXT, imagePath TEXT, loginProvider TEXT, token TEXT)';
String categorySqlCreateQuery = 'CREATE TABLE categories(id INTEGER PRIMARY KEY, parent INTEGER, name TEXT, imagePath TEXT)';
String itemSqlCreateQuery = 'CREATE TABLE items(id INTEGER PRIMARY KEY, categoryId INTEGER, availableQuantity INTEGER, price TEXT, discount TEXT, name TEXT, imagePath TEXT, description TEXT, discountFrom TEXT, discountTo TEXT)';
String addressSqlCreateQuery = 'CREATE TABLE addresses(id INTEGER PRIMARY KEY, userId INTEGER, city TEXT, village TEXT, phone TEXT, mobile TEXT, address TEXT, building TEXT)';
String notificationSqlCreateQuery = 'CREATE TABLE notifications(id INTEGER PRIMARY KEY, title TEXT, body TEXT, isShown INTEGER)';
String orderStatusSqlCreateQuery = 'CREATE TABLE orderStatuses(id INTEGER PRIMARY KEY, name TEXT)';
String orderSqlCreateQuery = 'CREATE TABLE orders(id INTEGER PRIMARY KEY, userId INTEGER, addressId INTEGER, orderStatusId INTEGER)';
String cartItemSqlCreateQuery = 'CREATE TABLE cartItems(id INTEGER PRIMARY KEY, userId INTEGER, productId INTEGER, orderId INTEGER)';
String activeUserIdSqlCreateQuery = 'CREATE TABLE activeUserId(id INTEGER PRIMARY KEY, email TEXT, password TEXT, provider TEXT, google_id TEXT, facebook_id TEXT)';

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

var database;
int selectedIndex = 0;

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

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => GoogleSignInController(), child: const RegisterPage())
    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      initialRoute: '',
      onGenerateRoute: RouteGenerator.generateRoute,
    ));
  }
}

Widget getImage(String? imagePath) {
  if (imagePath != null) {
    return FadeInImage(
      imageErrorBuilder: (context, error, stackTrace) {
        return const Image(
          image: AssetImage('assets/images/no_result.png'),
        );
      },
      placeholder: const AssetImage('assets/images/loading.gif'),
      image: NetworkImage(Global.storagePath + imagePath),
      fit: BoxFit.cover,
    );
  } else {
    return Image.asset('assets/images/no_result.png');
  }
}

addToCart(context, ItemModel item, {bool fromInit = false}) async {
  int? itemIndex = cart.findItemIndexFromCart(item.id);
  CartResponseWrapper cartResponseWrapper;
  User user = auth.user;
  Map<String, int> itemToServer = {};
  if (itemIndex == null) {
    Database db = await openDataBase();
      DBCartItem dbItem = DBCartItem(id: item.id, productId: item.id, userId: user.id);
      db.insert('cartItems', dbItem.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);

    cartResponseWrapper = cart.addToCart(productId: item.id, unitPrice: item.price.toDouble(), productName: item.name, productDetailsObject: item);
    itemToServer['user_id'] = auth.user.id;
    itemToServer['product_id'] = item.id;
    if (auth.user.id != 0) {
      ApiBaseHelper().post('new-cart-item', itemToServer);
    }
  } else {
    cartResponseWrapper = cart.incrementItemToCart(itemIndex);
    int? quantity =  cart.getSpecificItemFromCart(item.id)!.quantity;
    itemToServer['user_id'] = auth.user.id;
    itemToServer['product_id'] = item.id;
    itemToServer['quantity'] = quantity;
    if (auth.user.id != 0) {
      ApiBaseHelper().put('update-cart-item', itemToServer);
    }
  }

  // cartCount = cart.getCartItemCount();
  cartClass.updateCounter();
  if (!fromInit) {
    if (cartResponseWrapper.status) {
      showSuccessDialog(context, "نجاح", "تمت الاضافة");
    } else {
      showErrorDialog(context, "خطأ", "حدث خطأ بالاضافة");
    }
  }
}

Future<List<dynamic>> getNotifications() async {
  return await ApiBaseHelper().get('notifications') as List<dynamic>;
}

Future<Database> openDataBase() async {
  if (database is Database && database.isOpen) {
    return database;
  } else {
    database = await openDatabase(
        join(await getDatabasesPath(), 'wooow_supermarket.db'),
        onCreate: (db, version) => _createTables(db, version),
        onOpen: (db) => _prepareData(db),
        version: 1,
    );
    return database;
  }
}