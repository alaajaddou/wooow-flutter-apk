import 'package:flutter/material.dart';
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
                if (RouteGenerator.currentRoute != 'about') {
                  Navigator.of(context).pushNamed('about', arguments: 'test');
                }
              },
            ),
            IconButton(
              icon: ShoppingCartIcon(),
              onPressed: () {
                // do something
              },
            ),
            IconButton(
              icon: NotificationIcon(),
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
        );
  }
}
