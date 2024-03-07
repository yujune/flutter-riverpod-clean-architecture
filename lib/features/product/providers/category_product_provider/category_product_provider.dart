import 'package:flutter_clean_architecture/core/data/models/paginated_response/paginated_response.dart';
import 'package:flutter_clean_architecture/features/product/data/models/product/product.dart';
import 'package:flutter_clean_architecture/features/product/data/repositories/product_respository/product_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_product_provider.g.dart';

@riverpod
Future<PaginatedResponse<Product>?> categoryProducts(
  CategoryProductsRef ref, {
  required String productName,
}) {
  final productRepository = ref.watch(productRepositoryImplProvider);
  return productRepository.getCategoryProducts(categoryName: productName);
}
