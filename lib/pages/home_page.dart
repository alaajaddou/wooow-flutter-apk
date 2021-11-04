import 'dart:convert';

import 'package:flutter/material.dart';
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
  late List<dynamic> tempCategories = [];
  List<dynamic> categories = [];

  List<dynamic> items = [];

  dynamic getAllData() async {
    return await ApiBaseHelper().get('get-all-data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(children: [
        Image.asset(
          'assets/images/banner.jpg',
        ),
        FutureBuilder<dynamic>(
            future: getAllData(),
            initialData: const {},
            builder: (context, snapshot) {
              return snapshot.hasData ? CircleImages(categories: prepareItems(snapshot.data)) : Container(height: 90.0, decoration: const BoxDecoration(color: Colors.black12), child: const Center(child: CircularProgressIndicator()));
            }),
        FutureBuilder<dynamic>(
            future: getAllData(),
            initialData: const {},
            builder: (context, snapshot) {
              return snapshot.hasData ? Categories(categories: prepareItems(snapshot.data)) : const Expanded(child: Center(child: CircularProgressIndicator()));
            }),
      ]),
      bottomNavigationBar: const CustomNavigator(),
    );
  }

  List<dynamic> prepareItems(dynamic data) {
    String dataString = data.toString();
    final dynamic dataConverted = jsonDecode(dataString);
    if (dataConverted['categories'] == null) {
      return [];
    }
    List<dynamic> categories = dataConverted['categories'];
    List<dynamic> categoriesWithItems = [];
    if (categories.isNotEmpty) {
      for (var category in categories) {
        if (category['items'].isNotEmpty) {
          for (var item in category['items']) {
            item['categoryName'] = category['name'];
          }
        }
        if (category['items'].length > 0) {
          categoriesWithItems.add(category);
        }
      }
    }
    return categoriesWithItems;
  }
}
