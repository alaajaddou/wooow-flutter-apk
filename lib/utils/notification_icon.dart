import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:wooow_supermarket/main.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget icon;
    if (cart.getCartItemCount() > 0) {
      icon = Badge(
        badgeColor: Colors.red,
        padding: const EdgeInsets.all(3.0),
        badgeContent: Text(cart.getCartItemCount().toString(), style: const TextStyle(color: Colors.white)),
        showBadge: true,
        child: const Icon(
          Icons.notifications_active,
          color: Colors.white,
          size: 30,
        ),
      );
    } else {
      icon = Stack(
          children: const <Widget>[
            Icon(
              Icons.notifications_off_outlined,
              color: Colors.white,
              size: 30,
            ),
          ]
      );
    }
    return icon;
  }
}
