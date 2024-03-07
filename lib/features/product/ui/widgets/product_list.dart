import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/product/providers/category_product_provider/category_product_provider.dart';
import 'package:flutter_clean_architecture/features/product/ui/widgets/product_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductList extends ConsumerWidget {
  const ProductList({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryProducts =
        ref.watch(categoryProductsProvider(productName: categoryName));

    return switch (categoryProducts) {
      AsyncValue(:final error?) => Center(
          child: Text('Something went wrong $error'),
        ),
      AsyncValue(:final valueOrNull?) => RefreshIndicator(
          onRefresh: () => ref.refresh(
              categoryProductsProvider(productName: categoryName).future),
          child: ListView.builder(
            itemCount: valueOrNull.products?.length,
            itemBuilder: (context, index) => ProductItem(
              product: valueOrNull.products?[index],
            ),
          ),
        ),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
