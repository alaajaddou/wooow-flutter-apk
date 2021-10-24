import 'package:flutter/material.dart';
import 'package:wooow_supermarket/utils/categories.dart';
import 'package:wooow_supermarket/utils/circle_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(
        'assets/images/banner.jpg',
      ),
      CircleImages(),
      Categories(),
    ]);
  }
}