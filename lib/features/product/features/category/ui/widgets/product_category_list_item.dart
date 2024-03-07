import 'package:flutter/material.dart';

class ProductCategoryListItem extends StatelessWidget {
  const ProductCategoryListItem({
    super.key,
    required this.category,
    required this.onTap,
  });

  final String category;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(category)),
      ),
    );
  }
}
