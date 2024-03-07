import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/app_search_bar.dart';
import 'package:flutter_clean_architecture/features/product/features/search_product/providers/product_search_field_provider/product_search_filed_provider.dart';
import 'package:flutter_clean_architecture/features/product/features/search_product/ui/widgets/search_product_list.dart';
import 'package:flutter_clean_architecture/features/product/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchProductPage extends ConsumerWidget {
  const SearchProductPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        bottom: PreferredSize(
          preferredSize: const Size(double.maxFinite, 50),
          child: AppSearchBar(
            suggestionList: productSuggestionList,
            onChanged: (value) {
              ref.read(productSearchFieldProvider.notifier).update(value);
            },
          ),
        ),
      ),
      body: const SearchProductList(),
    );
  }
}
