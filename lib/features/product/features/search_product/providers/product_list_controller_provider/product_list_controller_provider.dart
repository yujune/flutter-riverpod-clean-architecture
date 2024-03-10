import 'package:flutter_clean_architecture/features/product/data/models/product/product.dart';
import 'package:flutter_clean_architecture/features/product/data/repositories/product_respository/product_repository_impl.dart';
import 'package:flutter_clean_architecture/features/product/features/search_product/mixin/pagination_provider_mixin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_list_controller_provider.g.dart';

@riverpod
class ProductListController extends _$ProductListController
    with PaginationProvider<Product> {
  String _searchText = "";

  @override
  Future<List<Product>> build() async {
    page = 0;
    final productRepository = ref.watch(productRepositoryImplProvider);
    final response = await productRepository.getProducts(
      productName: _searchText,
      limit: size,
      skip: 0,
    );

    final newProductList = response?.products ?? [];
    setCanLoadMore(list: newProductList);
    return newProductList;
  }

  void updateSearch({required String value}) {
    _searchText = value;
    ref.invalidateSelf();
  }

  Future<void> addProduct({required String productName}) async {
    final productRepository = ref.watch(productRepositoryImplProvider);
    await productRepository.addProduct(productName: productName);
    ref.invalidateSelf();
  }

  @override
  Future<List<Product>> fetchData(
      {required int limit, required int skip}) async {
    final productRepository = ref.watch(productRepositoryImplProvider);
    final response = await productRepository.getProducts(
      productName: _searchText,
      limit: limit,
      skip: skip,
    );

    return response?.products ?? [];
  }
}
