import 'package:bloc_learning/features/products/data/repository/products_repository_impl.dart';
import 'package:bloc_learning/features/products/domain/entities/product_entity.dart';
import 'package:bloc_learning/features/products/domain/repository/product_repository.dart';

class GetProductsUsecase {
  final ProductRepository _productRepository = ProductsRepositoryImpl();

  Future<List<ProductEntity>> call() async {
    return await _productRepository.getProducts();
  }
}
