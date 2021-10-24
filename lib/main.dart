import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:wooow_supermarket/pages/cart_page.dart';
import 'package:wooow_supermarket/pages/category_list.dart';
import 'package:wooow_supermarket/pages/category_page.dart';
import 'package:wooow_supermarket/pages/checkout_page.dart';
import 'package:wooow_supermarket/pages/home_page.dart';
import 'package:wooow_supermarket/pages/notification_page.dart';
import 'package:wooow_supermarket/pages/order_list.dart';
import 'package:wooow_supermarket/pages/product_detail_page.dart';
import 'package:wooow_supermarket/pages/profile_page.dart';
import 'package:wooow_supermarket/pages/search_page.dart';
import 'package:wooow_supermarket/pages/thank_you_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade300,
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
          child: Image.asset(
            "assets/images/logo.png",
          ),
        ),
        actions: <Widget>[
          IconButton(
            splashRadius: Material.defaultSplashRadius,
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_off_outlined,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
      ),
      body:  const ProfilePage(),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.lightGreen.shade300, primaryColor: Colors.white, textTheme: Theme.of(context).textTheme.copyWith(caption: const TextStyle(color: Colors.grey))),
          child: BottomNavigationBar(
            backgroundColor: Colors.lightGreen.shade300,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white70,
            showUnselectedLabels: true,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'التصنيفات',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.file_copy_rounded),
                label: 'الطلبيات',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'الحساب',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          )),
    );
  }
}