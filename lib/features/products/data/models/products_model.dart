import 'package:bloc_learning/features/products/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({required super.id, required super.name, required super.imageUrl});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(id: json['id'], name: json['title'], imageUrl: json['thumbnail']);
  }
}
