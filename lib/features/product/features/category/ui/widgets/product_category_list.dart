import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/product/features/category/providers/product_category_provider/product_category_provider.dart';
import 'package:flutter_clean_architecture/features/product/features/category/ui/widgets/product_category_list_item.dart';
import 'package:flutter_clean_architecture/features/product/route/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductCategoryList extends ConsumerWidget {
  const ProductCategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(productCategoryProvider);

    return switch (categories) {
      AsyncValue(:final error?) => Center(
          child: Text('Something went wrong $error'),
        ),
      AsyncValue(:final valueOrNull?) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: valueOrNull.length,
          itemBuilder: (context, index) => ProductCategoryListItem(
            onTap: () => context.goNamed(
              ProductRoute.categoryProduct,
              pathParameters: {
                'categoryName': valueOrNull[index],
              },
            ),
            category: valueOrNull[index],
          ),
        ),
      _ => const Center(
          child: CircularProgressIndicator(),
        ),
    };
  }
}
