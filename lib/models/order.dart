import 'package:wooow_supermarket/models/custom_cart_item.dart';

class Order {
  final int id;
  final int userId;
  final int addressId;
  final List<CustomCartItem> items;
  final int orderStatusId;
  final int? numberOfItems;
  final String? orderDate;

  Order({
    required this.id,
    required this.userId,
    required this.addressId,
    required this.items,
    required this.orderStatusId,
    this.orderDate,
    this.numberOfItems,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'addressId': addressId,
      'orderStatusId': orderStatusId,
    };
  }

  @override
  String toString() {
    return 'Order(id: $id, userId: $userId, addressId: $addressId, items: $items, orderStatusId: $orderStatusId)';
  }
}
