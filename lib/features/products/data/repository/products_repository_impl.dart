import 'package:bloc_learning/features/products/data/datasource/product_remote_datasource.dart';
import 'package:bloc_learning/features/products/domain/entities/product_entity.dart';
import 'package:bloc_learning/features/products/domain/repository/product_repository.dart';

class ProductsRepositoryImpl extends ProductRepository {
  final ProductRemoteDatasource _productRemoteDatasource = ProductRemoteDatasourceImpl();
  @override
  Future<List<ProductEntity>> getProducts() async {
    final products = await _productRemoteDatasource.getProducts();
    return products.map((e) => ProductEntity(id: e.id, name: e.name, imageUrl: e.imageUrl)).toList();
  }
}
