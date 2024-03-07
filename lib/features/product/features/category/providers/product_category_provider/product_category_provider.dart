import 'package:flutter_clean_architecture/features/product/data/repositories/product_respository/product_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_category_provider.g.dart';

@riverpod
Future<List<String>> productCategory(ProductCategoryRef ref) {
  final productRepositoryImpl = ref.watch(productRepositoryImplProvider);
  return productRepositoryImpl.getCategories();
}
