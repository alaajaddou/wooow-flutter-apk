import 'package:flutter/material.dart';

class CircleImages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CircleWidgets();
  }
}

class CircleWidgets extends State<CircleImages> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (var x = 0; x < 10; x++) {
      widgets.add(Column(
        children: [
          Container(
              height: 50.0,
              width: 50.0,
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  boxShadow: const [BoxShadow(color: Color.fromARGB(100, 0, 0, 0), blurRadius: 5.0, offset: Offset(5.0, 5.0))],
                  border: Border.all(width: 2.0, style: BorderStyle.solid, color: Colors.lightGreen.shade300),
                  image: const DecorationImage(fit: BoxFit.cover, image: NetworkImage("https://cdn.dribbble.com/users/1368/screenshots/1785863/icons_2x.png")))),
          const Text(
            "Category",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
          )
        ],
      ));
    }
    return Container(
        decoration: const BoxDecoration(color: Colors.black12),
        height: 90.0,
        child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.all(5.0), children: widgets));
  }
}
