import 'package:bloc/bloc.dart';
import 'package:bloc_learning/features/products/domain/entities/product_entity.dart';
import 'package:bloc_learning/features/products/domain/usecase/get_products_usaecase.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial()) {
    fetchProducts();
  }

  final List<ProductEntity> _cartProducts = [];
  final GetProductsUsecase _getProductsUsecase = GetProductsUsecase();

  List<ProductEntity> get cartProducts => _cartProducts;

  void fetchProducts() async {
    emit(ProductsLoading());
    final products = await _getProductsUsecase.call();
    emit(ProductsLoaded(products: products));
  }

  void addToCart(ProductEntity product) {
    _cartProducts.add(product);
  }

  void removeFromCart(ProductEntity product) {
    _cartProducts.remove(product);
  }
}
