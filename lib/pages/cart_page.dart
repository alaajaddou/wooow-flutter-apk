import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/models/cart_notifier.dart';
import 'package:wooow_supermarket/models/custom_cart_item.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/global.dart';
import 'package:wooow_supermarket/utils/route_generator.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: CustomAppBar(isHome: false),
      body: cart.cartItem.isNotEmpty
          ? Builder(
              builder: (context) {
                return Column(
                  children: <Widget>[createHeader(), createSubTitle(), Expanded(child: ValueListenableBuilder(
                    valueListenable: cartNotifier,
                    builder: (context, value, child) => createCartList(cartNotifier.itemList),
                  )), footer(context)],
                );
              },
            )
          : Center(
              child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('لا يوجد اصناف'),
                ElevatedButton(
                    onPressed: () {
                      backToHome(context);
                    },
                    style: getButtonStyle(),
                    child: const Text('تسوق الان', style: TextStyle(color: Colors.white)))
              ],
            )),
      bottomNavigationBar: const CustomNavigator(),
    );
  }

  footer(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: const Text(
                  "المجموع",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 30),
                child: ValueListenableBuilder(
                  builder: (context, value, child) => Text(
                    getFormattedCurrency(cart.getTotalAmount()),
                    style: TextStyle(color: getPrimaryColor(), fontSize: 14),
                  ),
                  valueListenable: cartClass,
                ),
              ),
            ],
          ),
          const Divider(height: 8, thickness: 1),
          ElevatedButton(
            style: getButtonStyle(),
            onPressed: () {
              if (auth.isAuthenticated) {
                if (!RouteGenerator.checkIfSameRoute(context, 'checkout')) {
                  Navigator.of(context).pushReplacementNamed('checkout');
                }
              } else {
                if (!RouteGenerator.checkIfSameRoute(context, 'login')) {
                  Navigator.of(context).pushNamed('login');
                }
              }
            },
            child: const Text(
              "الدفع",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Divider(height: 8, thickness: 1),
        ],
      ),
      margin: const EdgeInsets.only(top: 16),
    );
  }

  createHeader() {
    return Container(
      alignment: Alignment.topRight,
      child: const Text(
        "تفاصيل السلة",
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
      margin: const EdgeInsets.only(left: 12, top: 12),
    );
  }

  createSubTitle() {
    return Container(
      alignment: Alignment.topRight,
      child: Text(
        "مجموع الاصناف (" + cart.getCartItemCount().toString() + ")",
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      margin: const EdgeInsets.only(right: 12, top: 4),
    );
  }

  createCartList(List<CartItem> itemList) {
    ListView cartItemsList = ListView.builder(
      itemBuilder: (context, index) {
        return createCartListItem(itemList[index]);
      },
      scrollDirection: Axis.vertical,
      itemCount: cart.cartItem.length,
    );
    return cartItemsList;
  }

  createCartListItem(CartItem item) {
    CustomCartItem newItem = CustomCartItem(item);
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    image: DecorationImage(image: NetworkImage(Global.storagePath + newItem.item.productDetails.imagePath))),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          newItem.item.productName ??= '',
                          maxLines: 2,
                          softWrap: true,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      const Divider(height: 8, thickness: 1),
                      Text(
                        newItem.item.productName ?? '',
                        style: const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            getFormattedCurrency(newItem.item.unitPrice.toDouble()),
                            style: TextStyle(color: getPrimaryColor()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                GestureDetector(
                                    onTap: () => {
                                      if (newItem.getQuantity() > 1) {
                                        newItem.decrement()
                                      }
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      size: 24,
                                      color: Colors.grey.shade700,
                                    )),
                                Container(
                                  color: Colors.grey.shade200,
                                  padding: const EdgeInsets.only(bottom: 2, right: 12, left: 12),
                                  child: ValueListenableBuilder(
                                    valueListenable: newItem,
                                    builder: (context, value, child) => Text(
                                      newItem.getQuantity().toString(),
                                      style: const TextStyle(fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () => {
                                      if (newItem.getQuantity() != newItem.item.productDetails.availableQuantity) {
                                        newItem.increment()
                                      }
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 24,
                                      color: Colors.grey.shade700,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              newItem.removeItem();
              setState(() => {});
            },
            child: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 10, top: 8),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
              decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(4)), color: getPrimaryColor()),
            ),
          ),
        )
      ],
    );
  }

  void backToHome(context) {
    // Navigator.of(context).pushNamed('');
    if (!RouteGenerator.checkIfSameRoute(context, '')) {
      Navigator.of(context).pushReplacementNamed('');
    }
  }

  removeItem(int cartId) {
    int? index = cart.findItemIndexFromCart(cartId);
    if (index == null) {
      return;
    }
    cart.deleteItemFromCart(index);
  }

  increaseQuantity(int cartId) {
    int? index = cart.findItemIndexFromCart(cartId);
    if (index == null) {
      return;
    }
    cart.incrementItemToCart(index);
  }

  decreaseQuantity(int cartId) {
    int? index = cart.findItemIndexFromCart(cartId);
    if (index == null) {
      return;
    }
    cart.decrementItemFromCart(index);
  }
}