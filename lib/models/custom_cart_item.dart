import 'package:flutter/material.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/utils/global.dart';

class CustomCartItem extends ValueNotifier<CartItem?> {
  late CartItem item;

  CustomCartItem(this.item) : super(null);

  int getQuantity() {
    CartItem? tempItem = _getItem(item.productId);
    if (tempItem != null) {
      return tempItem.quantity;
    }
    return 0;
  }

  double getPrice() {
    CartItem? tempItem = _getItem(item.productId);
    if (tempItem != null) {
      return tempItem.unitPrice;
    }
    return 0;
  }

  CartItem? _getItem(id) {
    return cart.getSpecificItemFromCart(id);
  }

  void increment() {
    int? index = cart.findItemIndexFromCart(item.productId);
    if (index == null) {
      return;
    }
    cart.incrementItemToCart(index);
    if (auth.user.id != 0) {
      var cartItem = cart.getSpecificItemFromCart(item.productId);
      ApiBaseHelper().post('remove-cart-item', {'user_id': auth.user.id, 'product_id': item.productId, 'quantity': cartItem!.quantity});
    }
    cartClass.updateCounter();
    notifyListeners();
  }

  void decrement() {
    int? index = cart.findItemIndexFromCart(item.productId);
    if (index == null) {
      return;
    }
    cart.decrementItemFromCart(index);
    if (auth.user.id != 0) {
      var cartItem = cart.getSpecificItemFromCart(item.productId);
      if (cartItem != null) {
        ApiBaseHelper().post('remove-cart-item', {'user_id': auth.user.id, 'product_id': item.productId, 'quantity': cartItem.quantity});
      }
    }
    cartClass.updateCounter();
    notifyListeners();
  }

  void removeItem() {
    int? index = cart.findItemIndexFromCart(item.productId);
    if (index == null) {
      return;
    }
    cart.deleteItemFromCart(index);
    if (auth.user.id != 0) {
      ApiBaseHelper().post('remove-cart-item', {'user_id': auth.user.id, 'product_id': item.productId});
    }
    cartClass.updateCounter();
    notifyListeners();
  }
}
