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
    // if (cart.getCartItemCount() > 0) {
      icon = ValueListenableBuilder(
        builder: (context, value, child) => Badge(
          badgeColor: Colors.red,
          padding: const EdgeInsets.all(3.0),
          badgeContent: Text(cartClass.counter.toString(), style: const TextStyle(color: Colors.white)),
          showBadge: cartClass.counter > 0,
          child: const Icon(
            Icons.shopping_cart,
            size: 30,
          ),
        ),
        valueListenable: cartClass,
      );
    // } else {
    //   icon = const Icon(
    //     Icons.shopping_cart_outlined,
    //     color: Colors.white,
    //     size: 30,
    //   );
    // }
    return icon;
  }
}