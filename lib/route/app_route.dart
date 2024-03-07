import 'package:flutter_clean_architecture/features/product/route/index.dart';
import 'package:go_router/go_router.dart';

final appRoute = GoRouter(
  routes: [
    ProductRoute.productCategoryRoute,
  ],
);
