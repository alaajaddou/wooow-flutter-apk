import 'package:flutter/material.dart';
import 'package:wooow_supermarket/pages/about_page.dart';
import 'package:wooow_supermarket/pages/cart_page.dart';
import 'package:wooow_supermarket/pages/category_list.dart';
import 'package:wooow_supermarket/pages/category_page.dart';
import 'package:wooow_supermarket/pages/home_page.dart';
import 'package:wooow_supermarket/pages/login_page.dart';
import 'package:wooow_supermarket/pages/notification_page.dart';
import 'package:wooow_supermarket/pages/order_list.dart';
import 'package:wooow_supermarket/pages/product_detail_page.dart';
import 'package:wooow_supermarket/pages/profile_page.dart';
import 'package:wooow_supermarket/pages/register_page.dart';
import 'package:wooow_supermarket/pages/search_page.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';

class RouteGenerator {
  static var currentRoute;
  static Route<dynamic> generateRoute(RouteSettings settings) {
      final arguments = settings.arguments;
      currentRoute = settings.name;
      switch (settings.name) {
        case '':
          return MaterialPageRoute(builder: (_) => const HomePage());
        case 'search':
          return MaterialPageRoute(builder: (_) => SearchPage());
        case 'cart':
          return MaterialPageRoute(builder: (_) => const CartPage());
        case 'notification':
          return MaterialPageRoute(builder: (_) => NotificationPage());
        case 'categories':
          return MaterialPageRoute(builder: (_) => const CategoryList());
        case 'category':
          return MaterialPageRoute(builder: (_) => const CategoryPage());
        case 'product':
          return MaterialPageRoute(builder: (_) => ProductDetailsPage());
        case 'orders':
          return MaterialPageRoute(builder: (_) => const OrderList());
        case 'account':
          return MaterialPageRoute(builder: (_) => const ProfilePage());
        case 'login':
          return MaterialPageRoute(builder: (_) => LoginPage());
        case 'register':
          return MaterialPageRoute(builder: (_) => RegisterPage());
        default:
          return MaterialPageRoute(builder: (_) => const ErrorPage());
      }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
          child: Text('Error')
      ),
      bottomNavigationBar: CustomNavigator(),
    );
  }
}
