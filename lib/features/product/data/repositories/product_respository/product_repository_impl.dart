import 'dart:convert';

import 'package:flutter_clean_architecture/config/chopper_config.dart';
import 'package:flutter_clean_architecture/core/data/models/paginated_response/paginated_response.dart';
import 'package:flutter_clean_architecture/features/product/data/models/product/product.dart';
import 'package:flutter_clean_architecture/features/product/data/repositories/product_respository/product_repository.dart';
import 'package:flutter_clean_architecture/features/product/data/services/product_service.dart';
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
  Future<PaginatedResponse<Product>?> getProducts(
      {required String productName}) async {
    final result = await productService.getProducts(productName);

    if (result.isSuccessful) {
      final value = json.decode(result.bodyString);
      return PaginatedResponse.fromJson(value, (p0) => Product.fromJson(p0));
    }

    return null;
  }
}
