import 'package:flutter_clean_architecture/config/navigation/navigation_service.dart';
import 'package:flutter_clean_architecture/features/product/route/index.dart';
import 'package:go_router/go_router.dart';

final appRoute = GoRouter(
  navigatorKey: NavigationService.navigatorKey,
  routes: [
    ProductRoute.productCategoryRoute,
  ],
);
