import 'package:flutter/material.dart';
import 'package:wooow_supermarket/models/category.dart';
import 'package:wooow_supermarket/models/item.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/global.dart';
import 'package:wooow_supermarket/utils/route_generator.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  dynamic getAllData() async {
    return await ApiBaseHelper().get('get-all-data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isHome: false),
      body: FutureBuilder<dynamic>(
          future: getAllData(),
          initialData: const {},
          builder: (context, projectSnap) {
            return projectSnap.hasData && projectSnap.data['categories'] != null
                ? ListView.builder(
                    itemCount: getCategoriesCount(projectSnap.data),
                    itemBuilder: (context, index) {
                      var categoryHash = projectSnap.data['categories'][index];
                      List<ItemModel> itemList = prepareItems(categoryHash);
                      if (itemList.isNotEmpty) {
                        CategoryModel category =
                        CategoryModel(id: categoryHash['id'],
                            name: categoryHash['name'],
                            imagePath: categoryHash['image'],
                            parent: categoryHash['parent'],
                            items: itemList);
                        // var category = projectSnap.data['categories'][index];
                        return GestureDetector(
                            onTap: () {
                              if (!RouteGenerator.checkIfSameRoute(context, 'category')) {
                                Navigator.of(context).pushNamed('category', arguments: category);
                              }
                              // Navigator.of(context).pushNamed('category', arguments: category);
                            },
                            child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 5.0),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(category.imagePath == ''
                                            ? "https://i.pinimg.com/originals/87/21/98/872198c2f62aa608f6d657b61c5e65b6.jpg"
                                            : Global.storagePath + category.imagePath))),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                height: 110,
                                child: Center(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: getPrimaryColor(),
                                            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                            boxShadow: const [BoxShadow(color: Color.fromARGB(100, 0, 0, 0), blurRadius: 2.0, offset: Offset(2.0, 2.0))]),
                                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                                        child: Text(category.name, style: const TextStyle(color: Colors.white))))));
                      } else {
                        return Container();
                      }
                    },
                  )
                : const Center(child: CircularProgressIndicator());
          }),
      bottomNavigationBar: const CustomNavigator(),
    );
  }

  getCategoriesCount(data) {
    if (data != null) {
      return data['categories'] != null ? data['categories'].length : 0;
    }
    return 0;
  }

  List<ItemModel> prepareItems(category) {
    List<ItemModel> tempItems = [];
    if (category['items'].isNotEmpty) {
      for (dynamic item in category['items']) {
        ItemModel tempItem = ItemModel(
          id: item['id'],
          name: item['name'],
          imagePath: item['imagePath'] ?? item['image'] ?? null,
          description: item['description'],
          price: item['price'].toDouble(),
          categoryId: category['id'],
          categoryName: category['name'],
          availableQuantity: item['quantity'],
          discount: item['discount'] != null ? item['discount'].toDouble() : 0.0,
          discountFrom: item['discountFrom'],
          discountTo: item['discountTo'],
        );
        tempItems.add(tempItem);
      }
    }
    return tempItems;
  }
}
