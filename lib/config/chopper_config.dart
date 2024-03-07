import 'package:chopper/chopper.dart';
import 'package:flutter_clean_architecture/features/product/data/services/product_service.dart';

final chopper = ChopperClient(
  baseUrl: Uri.parse("https://dummyjson.com"),
  services: [
    ProductService.create(),
  ],
);
