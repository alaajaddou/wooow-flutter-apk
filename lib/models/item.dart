class ItemModel {
  final int id;
  final String name;
  final String? imagePath;
  final String description;
  final double price;
  final int categoryId;
  final String categoryName;
  final int availableQuantity;
  final double? discount;
  final String? discountFrom;
  final String? discountTo;

  ItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.categoryName,
    required this.availableQuantity,
    this.imagePath,
    this.discount,
    this.discountFrom,
    this.discountTo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'description': description,
      'price': price.toString(),
      'categoryId': categoryId,
      'availableQuantity': availableQuantity,
      'discount': discount.toString(),
      'discountFrom': discountFrom,
      'discountTo': discountTo,
    };
  }

  @override
  String toString() {
    return 'Item(id: $id,name: $name,imagePath: $imagePath,description: $description,price: $price,categoryId: $categoryId,availableQuantity: $availableQuantity,discount: $discount,discountFrom: $discountFrom,discountTo: $discountTo)';
  }
}
