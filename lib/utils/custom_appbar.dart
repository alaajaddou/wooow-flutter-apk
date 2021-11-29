import 'package:flutter/material.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/utils/global.dart';
import 'package:wooow_supermarket/utils/notification_icon.dart';
import 'package:wooow_supermarket/utils/route_generator.dart';
import 'package:wooow_supermarket/utils/shopping_cart_icon.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  bool isHome = true;
  CustomAppBar({Key? key, required this.isHome}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _CustomAppBarState extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    AppBar appbar = AppBar(
      backgroundColor: getPrimaryColor(),
      automaticallyImplyLeading: true,
      actionsIconTheme: const IconThemeData(
        color: Colors.white
      ),
      iconTheme: const IconThemeData(
        color: Colors.white
      ),
      centerTitle: true,
      title: SizedBox(
        height: 60,
        child: Image.asset(
          "assets/images/logo.png",
        ),
      ),
      actions: <Widget>[
        // IconButton(
        //   splashRadius: Material.defaultSplashRadius,
        //   icon: const Icon(
        //     Icons.search,
        //     color: Colors.white,
        //     size: 30,
        //   ),
        //   onPressed: () {
        //     if (RouteGenerator.currentRoute != 'search') {
        //       Navigator.of(context).pushNamed('search');
        //     }
        //   },
        // ),
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
        // IconButton(
        //   icon: const Icon(
        //     Icons.account_circle,
        //     color: Colors.white,
        //     size: 30,
        //   ),
        //   onPressed: () async {
        //     var user = await auth.getUser();
        //     if (user != null) {
        //       if (RouteGenerator.currentRoute != 'account') {
        //         Navigator.of(context).pushNamed('account');
        //       }
        //     } else {
        //       if (RouteGenerator.currentRoute != 'login') {
        //         Navigator.of(context).pushNamed('login');
        //       }
        //     }
        //   },
        // ),
      ],
    );

    return appbar;
  }
}
