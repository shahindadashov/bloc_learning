import 'package:bloc_learning/features/products/data/models/products_model.dart';
import 'package:dio/dio.dart';

abstract class ProductRemoteDatasource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final Dio dio = Dio();
  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get("https://dummyjson.com/products");
    return (response.data['products'] as List).map((e) => ProductModel.fromJson(e)).toList();
  }
}
