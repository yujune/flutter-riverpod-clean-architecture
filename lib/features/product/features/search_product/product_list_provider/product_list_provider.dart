import 'package:flutter_clean_architecture/core/data/models/paginated_response/paginated_response.dart';
import 'package:flutter_clean_architecture/features/product/data/models/product/product.dart';
import 'package:flutter_clean_architecture/features/product/data/repositories/product_respository/product_repository_impl.dart';
import 'package:flutter_clean_architecture/features/product/features/search_product/providers/product_search_field_provider/product_search_filed_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_list_provider.g.dart';

@riverpod
Future<PaginatedResponse<Product>?> productList(ProductListRef ref) {
  final productRepository = ref.watch(productRepositoryImplProvider);
  final searchValue = ref.watch(productSearchFieldProvider);

  return productRepository.getProducts(productName: searchValue);
}
