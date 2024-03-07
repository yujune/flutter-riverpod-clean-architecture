import 'package:flutter_clean_architecture/core/data/models/paginated_response/paginated_response.dart';
import 'package:flutter_clean_architecture/features/product/data/models/product/product.dart';

abstract class ProductRepository {
  Future<List<String>> getCategories();
  Future<PaginatedResponse<Product>?> getCategoryProducts(
      {required String categoryName});
  Future<PaginatedResponse<Product>?> getProducts(
      {required String productName});
}
