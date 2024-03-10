import 'dart:convert';

import 'package:flutter_clean_architecture/config/network/chopper_config.dart';
import 'package:flutter_clean_architecture/core/data/models/paginated_response/paginated_response.dart';
import 'package:flutter_clean_architecture/features/product/data/models/product/product.dart';
import 'package:flutter_clean_architecture/features/product/data/services/product_service.dart';
import 'package:flutter_clean_architecture/features/product/domain/repositories/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository_impl.g.dart';

@riverpod
ProductRepositoryImpl productRepositoryImpl(ProductRepositoryImplRef ref) =>
    ProductRepositoryImpl();

class ProductRepositoryImpl implements ProductRepository {
  final productService = chopper.getService<ProductService>();

  @override
  Future<List<String>> getCategories() async {
    final result = await productService.getCategories();

    if (result is String) {
      final value = json.decode(result);

      if (value is List) {
        return value.cast<String>();
      }
    }

    return [];
  }

  @override
  Future<PaginatedResponse<Product>?> getCategoryProducts(
      {required String categoryName}) async {
    final result = await productService.getCategoryProducts(categoryName);

    if (result.isSuccessful) {
      final value = json.decode(result.bodyString);
      return PaginatedResponse.fromJson(value, (p0) => Product.fromJson(p0));
    }

    return null;
  }

  @override
  Future<PaginatedResponse<Product>?> getProducts({
    required String productName,
    int limit = 15,
    int skip = 0,
  }) async {
    final result = await productService.getProducts(
      searchValue: productName,
      limit: limit,
      skip: skip,
    );

    if (result.isSuccessful) {
      final value = json.decode(result.bodyString);
      return PaginatedResponse.fromJson(value, (p0) => Product.fromJson(p0));
    }

    return null;
  }

  @override
  Future<Product?> addProduct({required String productName}) async {
    final result = await productService.addProduct(
      body: json.encode({
        "title": productName,
      }),
    );

    if (result.isSuccessful) {
      final value = json.decode(result.bodyString);
      return Product.fromJson(value);
    }

    return null;
  }
}
