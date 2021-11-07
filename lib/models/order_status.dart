class OrderStatus {
  final int id;
  final String name;

  OrderStatus({
    required this.id,
    required this.name
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name
    };
  }

  @override
  String toString() {
    return 'OrderStatus(id: $id, name: $name)';
  }
}