import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/product/features/category/ui/widgets/product_category_list.dart';
import 'package:flutter_clean_architecture/features/product/route/index.dart';
import 'package:go_router/go_router.dart';

class ProductCategoryListPage extends StatelessWidget {
  const ProductCategoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Categories"),
        actions: [
          IconButton(
            onPressed: () => context.goNamed(ProductRoute.searchProduct),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const ProductCategoryList(),
    );
  }
}
