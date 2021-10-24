import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  List<Category> items = [];
  List categoryList = ['Sender 1', 'Message body Test'];

  Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      // Let the ListView know how many items it needs to build.
      itemCount: categoryList.length,
      // Provide a builder function. This is where the magic happens.
      // Convert each item into a widget based on the type of item it is.
      itemBuilder: (context, index) {
        return Category(category: categoryList[index]);
      },
    ));
  }
}

class Category extends StatelessWidget {
  final String category;

  const Category({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item1 = {"name": "Item 1", "categoryName": category, "price": 120.0};
    final item2 = {"name": "Item 1", "categoryName": category, "price": 120.0};
    final item3 = {"name": "Item 1", "categoryName": category, "price": 120.0};
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Title(sender: category),
        CategoryItems(items: [item1, item2, item3])
      ],
    );
  }
}

class CategoryItems extends StatelessWidget {
  final List items;

  const CategoryItems({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (int index = 0; index < items.length; index++) {
      widgets.add(Container(
          width: 175,
          margin: const EdgeInsets.all(3.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.lightGreen.shade300), borderRadius: BorderRadius.circular(10)),
          child: Item(name: items[index]['name'], categoryName: items[index]['categoryName'], price: items[index]['price'])));
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
  final String name;
  final String categoryName;
  final double price;

  Item({Key? key, required this.name, required this.categoryName, required this.price}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network("https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg", height: 180),
        Text(widget.name),
        Text(widget.categoryName),
        Text('\$' + widget.price.toString()),
        MaterialButton(child: const Text("Add To Cart"), onPressed: () => {}, color: Colors.lightGreen.shade300),
      ],
    );
  }
}

class Title extends StatelessWidget {
  final String sender;

  Title({Key? key, required this.sender}) : super(key: key);

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
              top: BorderSide(width: 5.0, color: Colors.lightGreen.shade300),
              bottom: BorderSide(width: 5.0, color: Colors.lightGreen.shade300),
              left: BorderSide(width: 15.0, color: Colors.lightGreen.shade300),
              right: BorderSide(width: 15.0, color: Colors.lightGreen.shade300),
            )),
        child: Text(sender, textAlign: TextAlign.center));
  }
}
