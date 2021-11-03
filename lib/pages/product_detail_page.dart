import 'package:flutter/material.dart';
import 'package:wooow_supermarket/utils/global.dart';

import 'cart_page.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

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
    // TODO: implement initState
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
    var halfOfScreen = MediaQuery.of(context).size.height / 1.5;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(builder: (context) {
        return SizedBox(
          height: double.infinity,
          child: Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Hero(
                  tag: 'Test',
                  child: Image(
                    image: const NetworkImage(
                        "https://images.ctfassets.net/od02wyo8cgm5/1CXWFsj9uO4PFVauqBPKvj/c60845261ae99ce3150879f0f1b943a9/cloud-fw21-zinc_white-m-g1.png?w=630&h=630&fl=progressive&q=71&fit=pad&bg=rgb:f7f7f7&fm=jpg"),
                    height: halfOfScreen,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      height: 28,
                      width: 32,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        iconSize: 14,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 4,
                            width: 4,
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                          ),
                          Container(
                            height: 28,
                            width: 32,
                            child: IconButton(
                              icon: const Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CartPage()));
                              },
                              iconSize: 14,
                            ),
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade400),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: productDetailsSection(),
              )
            ],
          ),
        );
      }),
    );
  }

  productDetailsSection() {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 320,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: const Text(
                  "NIKE XTM Basketball Shoes",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              IconButton(icon: const Icon(Icons.close), onPressed: () {})
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 8),
            alignment: Alignment.topLeft,
            child: Text(
              "Colour",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 12),
            ),
          ),
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 40),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return createColorItem(index);
              },
              itemCount: listColor.length,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 8),
            child: Text(
              "Size",
              style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 12),
            ),
          ),
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 40),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return createSizeItem(index);
              },
              itemCount: listSize.length,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: const Text(
                  "Total",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: Text(
                  "\$299.00",
                  style: TextStyle(color: getPrimaryColor(), fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: getButtonStyle(),
            child: const Text(
              "Add To Cart",
              style: TextStyle(color: Colors.white),
            ),
          )
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
}