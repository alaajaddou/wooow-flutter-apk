import 'package:flutter/material.dart';
import 'package:wooow_supermarket/models/category.dart';
import 'package:wooow_supermarket/models/item.dart';
import 'package:wooow_supermarket/models/order.dart';
import 'package:wooow_supermarket/pages/addresses_page.dart';
import 'package:wooow_supermarket/pages/cart_page.dart';
import 'package:wooow_supermarket/pages/category_list.dart';
import 'package:wooow_supermarket/pages/category_page.dart';
import 'package:wooow_supermarket/pages/checkout_page.dart';
import 'package:wooow_supermarket/pages/home_page.dart';
import 'package:wooow_supermarket/pages/login_page.dart';
import 'package:wooow_supermarket/pages/new_address_page.dart';
import 'package:wooow_supermarket/pages/not_found.dart';
import 'package:wooow_supermarket/pages/notification_page.dart';
import 'package:wooow_supermarket/pages/order.dart';
import 'package:wooow_supermarket/pages/order_list.dart';
import 'package:wooow_supermarket/pages/product_detail_page.dart';
import 'package:wooow_supermarket/pages/profile_page.dart';
import 'package:wooow_supermarket/pages/register_page.dart';
import 'package:wooow_supermarket/pages/thank_you_page.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';

class RouteGenerator {
  static String? currentRoute;
  static String? oldRoute;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    currentRoute = settings.name;
    switch (settings.name) {
      case '':
        return MaterialPageRoute(
            builder: (_) => const HomePage(),
        );
      // case 'search':
      //   return MaterialPageRoute(builder: (_) => const SearchPage());
      case 'cart':
        return MaterialPageRoute(builder: (_) => const CartPage());
      case 'notification':
        return MaterialPageRoute(builder: (_) => NotificationPage());
      case 'categories':
        return MaterialPageRoute(builder: (_) => const CategoryList());
      case 'category':
        return MaterialPageRoute(builder: (_) => CategoryPage(category: arguments as CategoryModel));
      case 'product':
        return MaterialPageRoute(builder: (_) => ProductDetailsPage(item: arguments as ItemModel));
      case 'orders':
        return MaterialPageRoute(builder: (_) => const OrderList());
      case 'account':
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case 'addresses':
        return MaterialPageRoute(builder: (_) => AddressesPage(fromCheckout: arguments as bool));
      case 'new-address':
        return MaterialPageRoute(builder: (_) {
          return NewAddressPage(args: arguments as NewAddressArguments);
        });
      case 'login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case 'register':
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case 'order':
        Widget widget;
        if (arguments is Order) {
          widget = OrderPage(order: arguments);
        } else {
          widget = const NotFound();
        }
        return MaterialPageRoute(builder: (_) => widget);
      case 'checkout':
        return MaterialPageRoute(builder: (_) => const CheckOutPage());
      case 'thanks':
        return MaterialPageRoute(builder: (_) => const ThankYouPage());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorPage());
    }
  }

  static bool checkIfSameRoute(context, String newRouteName) {
    bool isNewRouteSameAsCurrent = false;

    if (RouteGenerator.currentRoute == newRouteName) {
      isNewRouteSameAsCurrent = true;
    }

    return isNewRouteSameAsCurrent;
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(isHome: false),
      body: const Center(child: Text('Error')),
      bottomNavigationBar: const CustomNavigator(),
    );
  }
}
