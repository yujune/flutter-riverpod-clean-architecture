import "dart:async";
import 'package:chopper/chopper.dart';

part "product_service.chopper.dart";

@ChopperApi(baseUrl: "/products")
abstract class ProductService extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static ProductService create([ChopperClient? client]) =>
      _$ProductService(client);

  @Get(path: "/categories")
  Future<String?> getCategories();

  @Get(path: "/category/{categoryName}")
  Future<Response> getCategoryProducts(
      @Path("categoryName") String categoryName);

  @Get(path: "/search")
  Future<Response> getProducts(@Query("q") String searchValue);
}
