import 'package:flutter/material.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:wooow_supermarket/main.dart';

class CustomCartItem extends ChangeNotifier  {
  late CartItem item;

  CustomCartItem(this.item);

  void increment() {
    int? index = cart.findItemIndexFromCart(item.productId);
    if (index == null) {
      return;
    }
    cart.incrementItemToCart(index);
    notifyListeners();
  }

  void decrement() {
    int? index = cart.findItemIndexFromCart(item.productId);
    if (index == null) {
      return;
    }
    cart.decrementItemFromCart(index);
    notifyListeners();
  }

  void removeItem() {
    int? index = cart.findItemIndexFromCart(item.productId);
    if (index == null) {
      return;
    }
    cart.deleteItemFromCart(index);
    notifyListeners();
  }
}