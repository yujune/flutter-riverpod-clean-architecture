import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/product/ui/widgets/product_list.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: ProductList(
        categoryName: categoryName,
      ),
    );
  }
}
