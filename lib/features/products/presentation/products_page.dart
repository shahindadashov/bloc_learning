import 'package:bloc_learning/features/products/presentation/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(),
      child: Builder(
        builder: (context) {
          final productsCubit = context.read<ProductsCubit>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: Text("Rossman"),
              actions: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              final product = productsCubit.cartProducts[index];
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.network(width: 100, height: 100, product.imageUrl),
                                      Text(product.name),
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      productsCubit.removeFromCart(product);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          duration: Duration(seconds: 1),
                                          content: Text("${product.name} removed from cart"),
                                        ),
                                      );
                                    },
                                    child: Text("Remove from Cart"),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            itemCount: productsCubit.cartProducts.length,
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                ),
              ],
            ),
            body: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductsLoaded) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [Image.network(width: 100, height: 100, product.imageUrl), Text(product.name)]),
                          ElevatedButton(
                            onPressed: () {
                              context.read<ProductsCubit>().addToCart(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text("${product.name} added to cart"),
                                ),
                              );
                            },
                            child: Text("Add to Cart"),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: state.products.length,
                  );
                }
                return SizedBox.shrink();
              },
            ),
          );
        },
      ),
    );
  }
}
