
import 'package:flutter/material.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/utils/global.dart';

import 'alert.dart';
import 'global.dart';

class Categories extends StatefulWidget {
  final List<dynamic> categories;

  const Categories({Key? key, required this.categories}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      // Let the ListView know how many items it needs to build.
      itemCount: widget.categories.length,
      // Provide a builder function. This is where the magic happens.
      // Convert each item into a widget based on the type of item it is.
      itemBuilder: (context, index) {
        return Category(category: widget.categories[index]);
      },
    ));
  }
}

class Category extends StatelessWidget {
  final dynamic category;

  const Category({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Title(sender: category['name']), CategoryItems(items: category['items'])],
    );
  }
}

class CategoryItems extends StatelessWidget {
  final List<dynamic> items;

  const CategoryItems({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    if (items.isNotEmpty) {
      for (int index = 0; index < items.length; index++) {
        widgets.add(Container(
            width: 175,
            margin: const EdgeInsets.all(3.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(border: Border.all(width: 1, color: getPrimaryColor()), borderRadius: BorderRadius.circular(10)),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('product');
                },
                child: Item(item: items[index]))));
      }
    }
    return SizedBox(
        height: 300,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: widgets,
        ));
  }
}

class Item extends StatefulWidget {
  final dynamic item;

  // final String categoryName;
  // final String price;

  const Item({Key? key, required this.item}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network("http://" + Global.baseUrl + '/storage/' + widget.item['image'], height: 150),
        Text(widget.item['name'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
        const Spacer(flex: 1),
        Text(widget.item['categoryName']),
        Text(getFormattedCurrency(widget.item['price'].toDouble())),
        MaterialButton(
            child: const Text("Add To Cart"),
            onPressed: () {
              debugPrint(widget.item['id']);
              int? itemIndex = cart.findItemIndexFromCart(widget.item['id']);
              bool isAdded;
              if (itemIndex == null) {
                isAdded =
                    cart.addToCart(productId: widget.item['id'], unitPrice: widget.item['price'], productName: widget.item['name'], productDetailsObject: widget.item);
              } else {
                isAdded = cart.incrementItemToCart(itemIndex);
              }
              cartCount = cart.getCartItemCount();
              if (isAdded) {
                showSuccessDialog(context, "نجاح", "تمت الاضافة");
              } else {
                showErrorDialog(context, "خطأ", "حدث خطأ بالاضافة");
              }
            },
            color: getPrimaryColor()),
      ],
    );
  }
}

class Title extends StatelessWidget {
  final String sender;

  const Title({Key? key, required this.sender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.lightGreen.shade100,
                blurRadius: 10.0, // soften the shadow
                spreadRadius: 2.0, //extend the shadow
                offset: const Offset(
                  1.0, // Move to right 10  horizontally
                  1.0, // Move to bottom 10 Vertically
                ),
              )
            ],
            border: Border(
              top: BorderSide(width: 5.0, color: getPrimaryColor()),
              bottom: BorderSide(width: 5.0, color: getPrimaryColor()),
              left: BorderSide(width: 15.0, color: getPrimaryColor()),
              right: BorderSide(width: 15.0, color: getPrimaryColor()),
            )),
        child: Text(sender, textAlign: TextAlign.center));
  }
}