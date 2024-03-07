// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ProductService extends ProductService {
  _$ProductService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ProductService;

  @override
  Future<String> getCategories() async {
    final Uri $url = Uri.parse('/products/categories');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    final Response $response = await client.send<String, String>($request);
    return $response.bodyOrThrow;
  }

  @override
  Future<Response<dynamic>> getCategoryProducts(String categoryName) {
    final Uri $url = Uri.parse('/products/category/${categoryName}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getProducts(String searchValue) {
    final Uri $url = Uri.parse('/products/search');
    final Map<String, dynamic> $params = <String, dynamic>{'q': searchValue};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
