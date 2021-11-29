import 'package:flutter/material.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isHome: false),
      bottomNavigationBar: const CustomNavigator(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8),
          child: Text(
            "واو وهو سوبر ماركت متكامل الخدمات ومعبأ بالكامل من منتجات عالية الجودة مع مزيج رائع من السلع التقليدية والمحلية والمنتجات المتنوعة",
            style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
          ),
        ),
      ),
    );
  }
}
