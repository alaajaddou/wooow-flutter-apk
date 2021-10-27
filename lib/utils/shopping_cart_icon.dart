import 'package:badges/badges.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wooow_supermarket/main.dart';

class ShoppingCartIcon extends StatefulWidget {
  const ShoppingCartIcon( {Key? key} ) : super(key: key);

  @override
  State<ShoppingCartIcon> createState() => _ShoppingCartIconState();
}

class _ShoppingCartIconState extends State<ShoppingCartIcon> {
  @override
  Widget build(BuildContext context) {
    Widget icon;
    if (cart.getCartItemCount() > 0) {
      icon = Badge(
        badgeColor: Colors.red,
        padding: const EdgeInsets.all(3.0),
        badgeContent: Text(cartCount.toString(), style: const TextStyle(color: Colors.white)),
        showBadge: true,
        child: const Icon(
          Icons.shopping_cart,
          color: Colors.white,
          size: 30,
        ),
      );
    } else {
      icon = const Icon(
        Icons.shopping_cart_outlined,
        color: Colors.white,
        size: 30,
      );
    }
    return icon;
  }
}