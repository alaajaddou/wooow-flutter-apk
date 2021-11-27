import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/models/category.dart';
import 'package:wooow_supermarket/models/item.dart';
import 'package:wooow_supermarket/utils/categories.dart';
import 'package:wooow_supermarket/utils/circle_image.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> _prepareCategories(data) {
    List<CategoryModel> categories = [];
    if (data['categories'] == null) {
      return categories;
    }

    for (dynamic category in data['categories']) {
      if (category['items'] != null && category['items'].isNotEmpty) {
        CategoryModel tempCategory = CategoryModel(id: category['id'], name: category['name'], parent: category['parent'], imagePath: category['image'], items: _prepareItemsForCategory(category['items'], category['id'], category['name']));

        if (database!.isOpen) {
          database!.insert(
            'categories',
            tempCategory.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
        categories.add(tempCategory);
      }
    }

    return categories;
  }

  dynamic getAllData() async {
    dynamic allData = await ApiBaseHelper().get('get-all-data');
    List<CategoryModel> preparedData = _prepareCategories(allData);
    return preparedData;
  }

  @override
  Widget build(BuildContext context) {

    InternetAddress.lookup(Global.baseUrl).then((result) {
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
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
      appBar: const CustomAppBar(),
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
              return snapshot.hasData && snapshot.connectionState == ConnectionState.done ? CircleImages(categories: snapshot.data) : Container(height: 90.0, decoration: const BoxDecoration(color: Colors.black12), child: const Center(child: CircularProgressIndicator()));
            }),
        FutureBuilder<dynamic>(
            future: getAllData(),
            initialData: const {},
            builder: (context, snapshot) {
              return snapshot.hasData && snapshot.connectionState == ConnectionState.done ? Categories(categories: snapshot.data) : const Expanded(child: Center(child: CircularProgressIndicator()));
            }),
      ]),
      bottomNavigationBar: const CustomNavigator(),
    );

  }

  List<ItemModel> _prepareItemsForCategory(List<dynamic> items, categoryId, categoryName) {
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

        if (database!.isOpen) {
          database!.insert(
            'items',
            tempItem.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      }
    }
    return itemsList;
  }
}
