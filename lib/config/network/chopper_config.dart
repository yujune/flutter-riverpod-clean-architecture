import 'package:chopper/chopper.dart';
import 'package:flutter_clean_architecture/config/network/chopper_error_convertor.dart';
import 'package:flutter_clean_architecture/config/network/chopper_interceptor.dart';
import 'package:flutter_clean_architecture/features/product/data/services/product_service.dart';

final chopper = ChopperClient(
  baseUrl: Uri.parse("https://dummyjson.com"),
  services: [
    ProductService.create(),
  ],
  errorConverter: AppErrorConverter(),
  interceptors: [
    AppInterceptor(),
  ],
);
