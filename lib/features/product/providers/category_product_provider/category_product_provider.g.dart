// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryProductsHash() => r'ca3d744b694635245df92e507a0056a1ae1bb58a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [categoryProducts].
@ProviderFor(categoryProducts)
const categoryProductsProvider = CategoryProductsFamily();

/// See also [categoryProducts].
class CategoryProductsFamily
    extends Family<AsyncValue<PaginatedResponse<Product>?>> {
  /// See also [categoryProducts].
  const CategoryProductsFamily();

  /// See also [categoryProducts].
  CategoryProductsProvider call({
    required String productName,
  }) {
    return CategoryProductsProvider(
      productName: productName,
    );
  }

  @override
  CategoryProductsProvider getProviderOverride(
    covariant CategoryProductsProvider provider,
  ) {
    return call(
      productName: provider.productName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'categoryProductsProvider';
}

/// See also [categoryProducts].
class CategoryProductsProvider
    extends AutoDisposeFutureProvider<PaginatedResponse<Product>?> {
  /// See also [categoryProducts].
  CategoryProductsProvider({
    required String productName,
  }) : this._internal(
          (ref) => categoryProducts(
            ref as CategoryProductsRef,
            productName: productName,
          ),
          from: categoryProductsProvider,
          name: r'categoryProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryProductsHash,
          dependencies: CategoryProductsFamily._dependencies,
          allTransitiveDependencies:
              CategoryProductsFamily._allTransitiveDependencies,
          productName: productName,
        );

  CategoryProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productName,
  }) : super.internal();

  final String productName;

  @override
  Override overrideWith(
    FutureOr<PaginatedResponse<Product>?> Function(CategoryProductsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoryProductsProvider._internal(
        (ref) => create(ref as CategoryProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productName: productName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PaginatedResponse<Product>?>
      createElement() {
    return _CategoryProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryProductsProvider &&
        other.productName == productName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryProductsRef
    on AutoDisposeFutureProviderRef<PaginatedResponse<Product>?> {
  /// The parameter `productName` of this provider.
  String get productName;
}

class _CategoryProductsProviderElement
    extends AutoDisposeFutureProviderElement<PaginatedResponse<Product>?>
    with CategoryProductsRef {
  _CategoryProductsProviderElement(super.provider);

  @override
  String get productName => (origin as CategoryProductsProvider).productName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
