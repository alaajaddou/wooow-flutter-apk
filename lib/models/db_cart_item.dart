class DBCartItem {
  final int id;
  final int? userId;
  final int productId;
  final int? orderId;

  DBCartItem({required this.id, required this.productId, this.userId, this.orderId});

  Map<String, dynamic> toMap() {
    return {'id': id, 'productId': productId, 'userId': userId, 'orderId': orderId};
  }

  @override
  String toString() {
    return 'DBCartItem{id: $id, productId: $productId, userId: $userId, orderId: $orderId}';
  }
}