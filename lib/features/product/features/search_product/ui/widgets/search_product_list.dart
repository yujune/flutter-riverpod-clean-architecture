import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/product/features/search_product/providers/product_list_controller_provider/product_list_controller_provider.dart';
import 'package:flutter_clean_architecture/features/product/ui/widgets/product_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchProductList extends HookConsumerWidget {
  SearchProductList({super.key});

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productListControllerProvider);

    return switch (products) {
      AsyncValue(:final error?) => Center(
          child: Text('Something went wrong $error'),
        ),
      AsyncValue(:final valueOrNull?) => SmartRefresher(
          controller: _refreshController,
          onRefresh: () async {
            final result = ref.refresh(productListControllerProvider.future);
            await result;
            _refreshController.refreshCompleted();
          },
          onLoading: () async {
            await ref.read(productListControllerProvider.notifier).fetchMore();
            _refreshController.loadComplete();
          },
          enablePullDown: true,
          enablePullUp: true,
          child: ListView.builder(
            itemCount: valueOrNull.length,
            itemBuilder: (context, index) => ProductItem(
              product: valueOrNull[index],
            ),
          ),
        ),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
