import 'package:wooow_supermarket/models/item.dart';

class CategoryModel {
  final int id;
  final String name;
  final String imagePath;
  final int? parent;
  final List<ItemModel> items;

  CategoryModel({required this.id, required this.name, required this.imagePath, this.parent, required this.items});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'imagePath': imagePath, 'parent': parent};
  }

  @override
  String toString() {
    return 'Category(id: $id, name: $name, imagePath: $imagePath, parent: $parent)';
  }
}
