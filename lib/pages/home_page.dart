import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/models/address.dart';
import 'package:wooow_supermarket/models/category.dart';
import 'package:wooow_supermarket/models/item.dart';
import 'package:wooow_supermarket/utils/categories.dart';
import 'package:wooow_supermarket/utils/circle_image.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/global.dart';

enum DataSource { db, server }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<CategoryModel>> _prepareCategories(data) async {
    List<CategoryModel> categories = [];
    if (data['categories'] == null) {
      return categories;
    }

    for (dynamic category in data['categories']) {
      if (category['items'] != null && category['items'].isNotEmpty) {
        CategoryModel tempCategory = CategoryModel(
            id: category['id'],
            name: category['name'],
            parent: category['parent'],
            imagePath: category['image'],
            items: await _prepareItemsForCategory(category['items'], category['id'], category['name']));

        Database db = await openDataBase();
        db.insert(
          'categories',
          tempCategory.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        categories.add(tempCategory);
      }
    }

    return categories;
  }

  dynamic getAllData() async {
    dynamic allData = await ApiBaseHelper().get('get-all-data');
    Future<List<CategoryModel>> preparedData = _prepareCategories(allData);
    return preparedData;
  }

  @override
  Widget build(BuildContext context) {
    InternetAddress.lookup(Global.baseUrl).then((result) {
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        getUser();
        print('connected');
      }
    }).catchError((error) {
      print('not connected');
      Alert(
          context: context,
          title: 'خطأ',
          desc: 'خطأ بالاتصال',
          image: const Image(
            height: 50,
            image: AssetImage("assets/images/error.png"),
          ),
          buttons: [
            DialogButton(
              child: const Text(
                "حسناً",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () => exit(0),
              color: getPrimaryColor(),
            ),
          ]).show();

      // showErrorDialog(context, 'خطأ', 'لابد من الاتصال بالانترنت');
    });

    return Scaffold(
      appBar: CustomAppBar(isHome: true),
      body: Column(children: [
        Image.asset(
          'assets/images/banner.jpg',
        ),
        FutureBuilder<dynamic>(
            future: getAllData(),
            initialData: const {},
            // builder: (context, snapshot) {
            //   return snapshot.hasData ? CircleImages(categories: prepareItems(snapshot.data)) : Container(
            //       height: 90.0, decoration: const BoxDecoration(color: Colors.black12), child: const Center(child: CircularProgressIndicator()));
            // }),
            builder: (context, snapshot) {
              return snapshot.hasData && snapshot.connectionState == ConnectionState.done
                  ? CircleImages(categories: snapshot.data)
                  : Container(height: 90.0, decoration: const BoxDecoration(color: Colors.black12), child: const Center(child: CircularProgressIndicator()));
            }),
        FutureBuilder<dynamic>(
            future: getAllData(),
            initialData: const {},
            builder: (context, snapshot) {
              return snapshot.hasData && snapshot.connectionState == ConnectionState.done
                  ? Categories(categories: snapshot.data)
                  : const Expanded(child: Center(child: CircularProgressIndicator()));
            }),
      ]),
      bottomNavigationBar: const CustomNavigator(),
    );
  }

  Future<List<ItemModel>> _prepareItemsForCategory(List<dynamic> items, categoryId, categoryName) async {
    List<ItemModel> itemsList = [];
    if (items.isNotEmpty) {
      for (var item in items) {
        ItemModel tempItem = ItemModel(
            id: item['id'],
            name: item['name'],
            imagePath: item['image'],
            description: item['description'],
            price: item['price'].toDouble(),
            categoryId: categoryId,
            categoryName: categoryName,
            availableQuantity: item['quantity'],
            discount: item['discount'] != null && item['discount'] != "null" ? item['discount'].toDouble() : 0,
            discountFrom: item['discount_from'],
            discountTo: item['discount_to']);
        itemsList.add(tempItem);
        Database db = await openDataBase();
        db.insert(
          'items',
          tempItem.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    }
    return itemsList;
  }

  getUser() async {
    try {
      String? email;
      String? password;
      String? provider;
      dynamic data;

      Database db = await openDataBase();
      List<dynamic> activeUsers = await db.query('activeUserId');

      if (activeUsers.isNotEmpty) {
        dynamic activeUser = activeUsers[0];
        data = activeUser;
        email = activeUser['email'];
        password = activeUser['password'];
        provider = activeUser['provider'];
      }

      if (data == null) {
        auth.setGuestUser();
      } else {
        if (provider == 'email') {
          String url ='login';
          dynamic user = await ApiBaseHelper().post(url, data);
          if (user['message'] == "Invalid Credentials") {
            auth.setGuestUser();
          } else {
            auth.prepareUser(user, 'email');
          }
        } else {
          String url = 'login-by-google';
          dynamic response = await ApiBaseHelper().post(url, data);
          auth.prepareUser( response['user'], 'google' );
        }
      }
      if (auth.user.id == 0) {
        getNotifications().then((value) => handleResponses(0, value));
        getCartItems(DataSource.db).then((value) => handleResponses(1, value));
      } else {
        getNotifications().then((value) => handleResponses(0, value));
        getCartItems(DataSource.server).then((value) => handleResponses(1, value));
        getOrders();
        getAddress().then((response) => handleResponses(3, response));
      }
    } catch (e) {
      auth.setGuestUser();
    }
  }

  getOrders() {
    return ApiBaseHelper().get('orders');
  }

  getAddress() {
    return ApiBaseHelper().get('addresses');
  }

  getCartItems(DataSource dataSource) {
    if (dataSource == DataSource.db) {
      return getLocalCartItems();
    } else {
      return ApiBaseHelper().get('cart-items');
    }
  }

  handleResponses(index, response) {
    if (index == 0) {
      // getNotifications
      if (response is List<dynamic>) {
        notificationCounter.updateNotificationCounter(response.length);
        return response;
      }
    }
    if (index == 1) {
      if (response.isNotEmpty) {
        // getCartItems
        for (int index = 0; index < response['items'].length; index++) {
          ItemModel _item = ItemModel(
            id: response['items'][index]['id'],
            name: response['items'][index]['name'],
            description: response['items'][index]['description'],
            price: response['items'][index]['price'],
            categoryId: response['items'][index]['categoryId'],
            categoryName: response['items'][index]['categoryName'],
            availableQuantity: response['items'][index]['availableQuantity'],
          );
        }
      }
      return;
    }
    if (index == 2) {
      // getOrders
      return;
    }
    if (index == 3) {
      List<dynamic> addresses = response['addresses'];
      for (int index = 0; index < addresses.length; index++) {
        dynamic addressObj = addresses[index];
        Address address = Address(
            id: addressObj['id'],
            city: addressObj['city'],
            village: addressObj['village'],
            phone: addressObj['phone'],
            mobile: addressObj['mobile'],
            address: addressObj['address'],
            building: addressObj['building'],
            userId: addressObj['user_id'],
            isDefault: addressObj['is_default'] == 1,
            deletable: addressObj['deletable']);
        auth.addresses.add(address);
        if (address.isDefault) {
          auth.address = address;
        }
      }
      return;
    }
  }

  Future<List<dynamic>> getLocalCartItems() async {
    List<dynamic> cartItems = [];
    Database db = await openDataBase();
    List<Map<String, Object?>> databaseCartItems = await db.query('cartItems', where: 'userId = ?', whereArgs: [auth.user.id]);
    if (databaseCartItems.isNotEmpty) {
      for (Map<String, Object?> cartItem in databaseCartItems) {
        List<Map<String, Object?>> item = await db.query('items', where: 'id = ?', whereArgs: [cartItem['productId']]);
        if (item.isNotEmpty) {
          ItemModel itemModel = ItemModel(
              id: item[0]['id'] as int,
              name: item[0]['name'] as String,
              description: item[0]['description'] as String,
              price: double.parse(item[0]['price'] as String),
              categoryId: item[0]['categoryId'] as int,
              categoryName: item[0]['categoryName'] as String,
              availableQuantity: item[0]['availableQuantity'] as int);
          addToCart(context, itemModel, fromInit: true);
        }
      }
    }
    return cartItems;
  }
}
