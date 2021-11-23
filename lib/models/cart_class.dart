import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:wooow_supermarket/main.dart';

class CartCounterClass extends ValueNotifier<num> {
  int _counter = cart.getCartItemCount();
  int get counter => _counter;
  set counter(counter) {
    _counter = counter;
  }

  double _total = cart.getTotalAmount();
  double get total => _total;
  set total(total) {
    _total = total;
  }

  CartCounterClass(int counter, double total) : super(0);

  updateCounter() {
    counter = cart.getCartItemCount();
    total = cart.getTotalAmount();
    notifyListeners();
  }
}