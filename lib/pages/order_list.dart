import 'package:flutter/material.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:wooow_supermarket/models/custom_cart_item.dart';
import 'package:wooow_supermarket/models/order.dart';
import 'package:wooow_supermarket/models/order_status.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/global.dart';
import 'package:wooow_supermarket/utils/route_generator.dart';

List<OrderStatus> statuses = [];

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  Future<List<dynamic>> getOrders() async {
    dynamic orders = await ApiBaseHelper().get('orders');
    prepareOrderStatuses(orders['statuses']);
    return orders['orders'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isHome: false),
      body: FutureBuilder(
        future: getOrders(),
        initialData: const [],
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            List list = (snapshot.data! as List);
            if (list.isNotEmpty) {
              return ListView.builder(
                  itemCount: snapshot.hasData ? list.length : 0,
                  itemBuilder: (context, i) {
                    List<CustomCartItem> items = [];
                    if (list[i]['items'] != null && (list[i]['items'] as List).isNotEmpty) {
                      for (dynamic arg in (list[i]['items'] as List)) {
                        CartItem item = CartItem(
                            productDetails: arg['item'],
                            productId: arg['item_id'],
                            productName: arg['item']['name'],
                            subTotal: arg['total'] != null ? arg['total'].toDouble() : 0.0,
                            unitPrice: arg['item']['price'].toDouble() ?? 0.0,
                            quantity: arg['quantity']);

                        CustomCartItem orderItem = CustomCartItem(item);
                        items.add(orderItem);
                      }
                    }
                    Order order = Order(
                        orderDate: list[i]!['created_at'],
                        addressId: list[i]['address_id'],
                        id: list[i]['id'],
                        userId: list[i]!['created_by'],
                        orderStatusId: list[i]['status'],
                        items: items,
                        numberOfItems: list[i]['numberOfItems']);
                    return OrderWidget(order: order);
                  });
            } else {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('لا يوجد طلبات'),
                    ElevatedButton(
                        onPressed: () => {
                              if (!RouteGenerator.checkIfSameRoute(context, '')) {Navigator.of(context).pushNamed('')}
                            },
                        child: const Text(
                          'تسوق الان',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {
                if (!RouteGenerator.checkIfSameRoute(context, 'cart')) {Navigator.of(context).pushNamed('cart')}
              },
          child: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 35.0,
          )),
      bottomNavigationBar: const CustomNavigator(),
    );
  }

  void prepareOrderStatuses(List orderStatuses) {
    if (orderStatuses.isNotEmpty) {
      statuses = [];
      for (dynamic status in orderStatuses) {
        statuses.add(OrderStatus(id: status['id'], name: status['name']));
      }
    }
  }
}

class OrderWidget extends StatefulWidget {
  Order order;

  OrderWidget({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(width: 2.0, color: getPrimaryColor()),
        bottom: BorderSide(width: 2.0, color: getPrimaryColor()),
        left: BorderSide(width: 1.0, color: getPrimaryColor()),
        right: BorderSide(width: 1.0, color: getPrimaryColor()),
      )),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    ElevatedButton(
                      onPressed: () => {
                        if (!RouteGenerator.checkIfSameRoute(context, 'order')) {Navigator.of(context).pushNamed('order', arguments: widget.order)}
                      },
                      style: getViewButtonStyle(),
                      child: const Icon(Icons.remove_red_eye_outlined, color: Colors.white),
                    ),
                    Text(" طلبية المشتريات ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500)),
                  ]),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [Text("عدد المنتجات " + (widget.order.numberOfItems).toString()), Text("بتاريخ " + widget.order.orderDate.toString())],
                        ),
                      ),
                      Column(
                        children: [Text("طلبية رقم " + widget.order.id.toString()), Text("حالة الطلبية: " + getStatusNameFromId(widget.order.orderStatusId))],
                      )
                    ],
                  )
                ],
              )),
            ],
          )
        ],
      ),
    );
  }

  String getStatusNameFromId(int orderStatusId) {
    if (statuses.isNotEmpty) {
      OrderStatus status = statuses.firstWhere((element) => element.id == orderStatusId);
      return status.name;
    }
    return '';
  }
}
