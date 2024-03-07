import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/product/data/models/product/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Row(
        children: [
          Image.network(
            product?.thumbnail ?? '',
            width: 50,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product?.title ?? 'Unknown'),
                const SizedBox(
                  height: 8,
                ),
                Text(product?.description ?? 'No Description'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
