import 'package:flutter_clean_architecture/features/product/features/category/ui/page/product_category_list_page.dart';
import 'package:flutter_clean_architecture/features/product/features/search_product/ui/page/search_product_page.dart';
import 'package:flutter_clean_architecture/features/product/ui/pages/product_list_page.dart';
import 'package:go_router/go_router.dart';

class ProductRoute {
  static const categoryProduct = 'categoryProduct';
  static const searchProduct = 'searchProduct';

  static final productCategoryRoute = GoRoute(
    path: '/',
    builder: (context, state) => const ProductCategoryListPage(),
    routes: [
      GoRoute(
        name: categoryProduct,
        path: 'category/product/:categoryName',
        builder: (context, state) => ProductListPage(
          categoryName: state.pathParameters["categoryName"] ?? '',
        ),
      ),
      GoRoute(
        name: searchProduct,
        path: 'product/search',
        builder: (context, state) => const SearchProductPage(),
      ),
    ],
  );
}
