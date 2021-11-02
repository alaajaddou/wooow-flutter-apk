import 'package:flutter/material.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/utils/global.dart';
import 'package:wooow_supermarket/utils/notification_icon.dart';
import 'package:wooow_supermarket/utils/route_generator.dart';
import 'package:wooow_supermarket/utils/shopping_cart_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
          backgroundColor: getPrimaryColor(),
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
                if (RouteGenerator.currentRoute != 'search') {
                  Navigator.of(context).pushNamed('search');
                }
              },
            ),
            IconButton(
              icon: const ShoppingCartIcon(),
              onPressed: () {

                if (RouteGenerator.currentRoute != 'cart') {
                  Navigator.of(context).pushNamed('cart');
                }
              },
            ),
            IconButton(
              icon: const NotificationIcon(),
              onPressed: () {
                if (RouteGenerator.currentRoute != 'notification') {
                  Navigator.of(context).pushNamed('notification');
                }
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {

                if (auth.getUser() != null) {
                  if (RouteGenerator.currentRoute != 'account') {
                    Navigator.of(context).pushNamed('account');
                  }
                } else {
                  if (RouteGenerator.currentRoute != 'register') {
                    Navigator.of(context).pushNamed('register');
                  }
                }
              },
            ),
          ],
        );
  }
}
