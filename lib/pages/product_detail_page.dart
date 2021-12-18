import 'package:flutter/material.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/models/item.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/global.dart';

class ProductDetailsPage extends StatefulWidget {
  ItemModel item;
  ProductDetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  List<Color> listColor = [];
  List<String> listSize = [];
  int selectedColor = -1;

  var selectedSize = -1;

  _ProductDetailsPageState();

  @override
  void initState() {
    super.initState();
    addColor();
    addSize();
  }

  void addColor() {
    listColor.add(Colors.red);
    listColor.add(getPrimaryColor());
    listColor.add(Colors.yellow);
    listColor.add(Colors.black);
    listColor.add(Colors.teal);
    listColor.add(Colors.blue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(isHome: false),
      body: Builder(builder: (context) {
        return SizedBox(
          height: double.infinity,
          child: Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Hero(tag: 'Test', child: getImage(widget.item.imagePath)),
              Align(
                alignment: Alignment.bottomCenter,
                child: productDetailsSection(),
              )
            ],
          ),
        );
      }),
      bottomNavigationBar: const CustomNavigator(),
    );
  }

  productDetailsSection() {
    return Container(
      padding: const EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height / 6,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: Text(
                  widget.item.name,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          // Container(
          //   margin: const EdgeInsets.only(left: 8),
          //   alignment: Alignment.topLeft,
          //   child: Text(
          //     "Colour",
          //     textAlign: TextAlign.start,
          //     style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 12),
          //   ),
          // ),
          // const SizedBox(height: 8),
          // ConstrainedBox(
          //   constraints: const BoxConstraints(maxHeight: 40),
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       return createColorItem(index);
          //     },
          //     itemCount: listColor.length,
          //   ),
          // ),
          // const SizedBox(height: 16),
          // Container(
          //   alignment: Alignment.topLeft,
          //   margin: const EdgeInsets.only(left: 8),
          //   child: Text(
          //     "Size",
          //     style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 12),
          //   ),
          // ),
          // const SizedBox(height: 8),
          // ConstrainedBox(
          //   constraints: const BoxConstraints(maxHeight: 40),
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       return createSizeItem(index);
          //     },
          //     itemCount: listSize.length,
          //   ),
          // ),
          // const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: const Text(
                  "السعر",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: Text(
                  widget.item.price.toString(),
                  style: TextStyle(color: getPrimaryColor(), fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          MaterialButton(
              child: const Text("أضف الى السلة"),
              onPressed: () async {
                addToCart(context, widget.item);
              },
              color: getPrimaryColor()),
        ],
      ),
      decoration: const BoxDecoration(shape: BoxShape.rectangle, color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
    );
  }

  Container createSizeItem(int index) {
    return Container(
      width: 28,
      margin: const EdgeInsets.all(4),
      height: 28,
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        listSize[index],
        style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.8)),
        textAlign: TextAlign.center,
      ),
      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: selectedSize == index ? Colors.blue : Colors.grey, width: 1), shape: BoxShape.circle),
    );
  }

  GestureDetector createColorItem(int index) {
    return GestureDetector(
      child: Container(
        width: 24,
        margin: const EdgeInsets.all(4),
        height: 24,
        decoration: BoxDecoration(color: listColor[index], border: Border.all(color: Colors.grey, width: selectedColor == index ? 2 : 0), shape: BoxShape.circle),
      ),
      onTap: () {
        setState(() {
          selectedColor = index;
        });
      },
    );
  }

  void addSize() {
    listSize.add("4");
    listSize.add("5");
    listSize.add("6");
    listSize.add("7");
    listSize.add("8");
    listSize.add("9");
    listSize.add("10");
  }

  getImage(imagePath) {
    var halfOfScreen = MediaQuery.of(context).size.height / 1.2;

    ImageProvider image;
    if (imagePath != null) {
      image = NetworkImage(Global.storagePath + imagePath);
    } else {
      image = const AssetImage('assets/images/no_result.png');
    }
    return Image(
      image: image,
      height: halfOfScreen,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
