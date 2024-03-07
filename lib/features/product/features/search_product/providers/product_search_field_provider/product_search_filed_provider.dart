import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_search_filed_provider.g.dart';

@riverpod
class ProductSearchField extends _$ProductSearchField {
  @override
  String build() {
    return "";
  }

  void update(String value) {
    state = value;
  }
}
