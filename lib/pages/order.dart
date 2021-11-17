import 'package:flutter/material.dart';
import 'package:wooow_supermarket/models/custom_cart_item.dart';
import 'package:wooow_supermarket/models/order.dart';
import 'package:wooow_supermarket/models/order_status.dart';
import 'package:wooow_supermarket/pages/order_list.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/global.dart';

class OrderPage extends StatefulWidget {
  Order order;
  List<OrderStatus> orderStatues = statuses;

  OrderPage({Key? key, required this.order}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(widget.order.id.toString()), const Text('رقم الطلبية')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(widget.order.orderDate ?? ''), const Text('تاريخ الطلب')],
          ),
          Expanded(child: createCartList(widget.order != null ? widget.order.items : [])),
          Row(children: [
            Expanded(
                child: Column(
              children: [
                Row(children: [
                  Expanded(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Text("حالة الطلبية", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade500))]),
                  )
                ]),
                Row(children: [
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: getDeliveryStatuses(),
                  ))
                ])
              ],
            ))
          ])
        ],
      ),
      bottomNavigationBar: const CustomNavigator(),
    );
  }

  createCartList(List items) {
    ListView cartItemsList = ListView.builder(
      itemBuilder: (context, index) {
        return createCartListItem(items[index]);
      },
      scrollDirection: Axis.vertical,
      itemCount: items.length,
    );
    return cartItemsList;
  }

  createCartListItem(CustomCartItem newItem) {
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
                decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("http://" + Global.baseUrl + "/storage/" + newItem.item.productDetails['image']))),
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
                          newItem.item.productDetails['name'],
                          maxLines: 2,
                          softWrap: true,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      const Divider(height: 8, thickness: 1),
                      Column(
                        children: [
                          Text(
                            newItem.item.productDetails['description'],
                            style: const TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Text(
                            'الكمية: ' + newItem.item.quantity.toString(),
                            style: const TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'المجموع: ' + getFormattedCurrency(newItem.item.subTotal),
                            style: TextStyle(color: getPrimaryColor()),
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
        )
      ],
    );
  }

  List<Widget> getDeliveryStatuses() {
    List<Widget> deliveryStatues = [];
    if (widget.orderStatues.isNotEmpty) {
      for (OrderStatus status in widget.orderStatues) {
        if (status.id == 0) {
          continue;
        }

        if (widget.order.orderStatusId >= status.id) {
          deliveryStatues.add(CompleteStatusWidget(status: status));
        } else {
          deliveryStatues.add(InCompleteStatusWidget(status: status));
        }
      }
    }
    return deliveryStatues;
  }
}

class CompleteStatusWidget extends StatelessWidget {
  OrderStatus status;
  CompleteStatusWidget({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.check, color: Colors.green, size: 24.0),
        Text(
          status.name,
          style: const TextStyle(color: Colors.green),
        )
      ],
    );
  }
}

class InCompleteStatusWidget extends StatelessWidget {
  OrderStatus status;
  InCompleteStatusWidget({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.warning_amber_rounded, color: Colors.amber, size: 24.0),
        Text(
          status.name,
          style: const TextStyle(color: Colors.amber),
        )
      ],
    );
  }
}
