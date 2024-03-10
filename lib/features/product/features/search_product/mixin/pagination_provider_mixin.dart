import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin PaginationProvider<T> on AutoDisposeAsyncNotifier<List<T>> {
  int page = 0;
  final int size = 15;
  bool canLoadMore = false;

  void setCanLoadMore({required List<T> list}) {
    canLoadMore = list.length == size;
  }

  Future<void> fetchMore() async {
    if (!canLoadMore) {
      return;
    }

    if (state.isLoading || state.isRefreshing || state.isReloading) {
      return;
    }

    page++;

    state = const AsyncValue.loading();

    final response = await fetchData(limit: size, skip: page * size);

    final newProductList = response;
    setCanLoadMore(list: newProductList);
    state = AsyncData(
      [...state.value ?? [], ...newProductList],
    );
  }

  Future<List<T>> fetchData({required int limit, required int skip});
}
