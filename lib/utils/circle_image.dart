import 'package:flutter/material.dart';
import 'package:wooow_supermarket/models/category.dart';
import 'package:wooow_supermarket/utils/global.dart';
import 'package:wooow_supermarket/utils/route_generator.dart';

class CircleImages extends StatefulWidget {
  final List<CategoryModel> categories;

  const CircleImages({Key? key, required this.categories}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CircleWidgets();
  }
}

class CircleWidgets extends State<CircleImages> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    if (widget.categories.isNotEmpty) {
      for (var element in widget.categories) {
        widgets.add(GestureDetector(
            onTap: () {
              if (!RouteGenerator.checkIfSameRoute(context, 'category')) {
                Navigator.of(context).pushNamed('category', arguments: element);
              }
            },
            child: Column(
              children: [
                Container(
                    height: 50.0,
                    width: 50.0,
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        boxShadow: const [BoxShadow(color: Color.fromARGB(100, 0, 0, 0), blurRadius: 5.0, offset: Offset(5.0, 5.0))],
                        border: Border.all(width: 2.0, style: BorderStyle.solid, color: getPrimaryColor()),
                        image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(element.imagePath == '' ? "https://i.pinimg.com/originals/87/21/98/872198c2f62aa608f6d657b61c5e65b6.jpg" :Global.storagePath + element.imagePath)))),
                Text(
                  element.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 10),
                )
              ],
            )));
      }
    }
    return Container(
        decoration: const BoxDecoration(color: Colors.black12),
        height: 90.0,
        child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.all(5.0), children: widgets));
  }
}