import 'package:flutter/material.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:wooow_supermarket/main.dart';

class CartNotifier extends ValueNotifier<List<CartItem>> {
  List<CartItem> itemList = cart.cartItem;
  CartNotifier(List<CartItem> value) : super(value);

  updateItemList() {
    itemList = cart.cartItem;
    notifyListeners();
  }
}
