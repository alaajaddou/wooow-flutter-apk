import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:wooow_supermarket/utils/categories.dart';
import 'package:wooow_supermarket/utils/circle_image.dart';
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

  getAllData() async {
    var apiHelper = ApiBaseHelper();
    dynamic response = await apiHelper.get('get-all-data');
    tempCategories = response['categories'];
    categories = prepareItems(tempCategories);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    getAllData();
    return Column(children: [
      Image.asset(
        'assets/images/banner.jpg',
      ),
      CircleImages(categories: tempCategories),
      Categories(categories: categories),
    ]);
  }

  List<dynamic> prepareItems(List<dynamic> categories) {
    List<dynamic> categoriesWithItems = [];
    if (categories.isNotEmpty) {
      for (var category in categories) {
        if (category['items'].isNotEmpty) {
          for (var item in category['items']) {
            item['categoryName'] = category['name'];
          }
        }
        print(category['id']);
        print(category['items'].length);
        if (category['items'].length > 0) {
          categoriesWithItems.add(category);
        }
      }
    }
    return categoriesWithItems;
  }
}