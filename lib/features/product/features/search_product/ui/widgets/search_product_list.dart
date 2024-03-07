import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/product/features/search_product/product_list_provider/product_list_provider.dart';
import 'package:flutter_clean_architecture/features/product/ui/widgets/product_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchProductList extends ConsumerWidget {
  const SearchProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productListProvider);

    return switch (products) {
      AsyncValue(:final error?) => Center(
          child: Text('Something went wrong $error'),
        ),
      AsyncValue(:final valueOrNull?) => RefreshIndicator(
          onRefresh: () => ref.refresh(productListProvider.future),
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
