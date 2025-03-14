// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_control.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productControlHash() => r'1f17d618ade64e5fed82f23878c96542dbba0303';

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

abstract class _$ProductControl
    extends BuildlessAsyncNotifier<List<ProductModel>> {
  late final int offset;
  late final String title;
  late final int limit;

  FutureOr<List<ProductModel>> build({
    int offset = 0,
    String title = "",
    int limit = FakeApiConst.apiQueryLimit,
  });
}

/// See also [ProductControl].
@ProviderFor(ProductControl)
const productControlProvider = ProductControlFamily();

/// See also [ProductControl].
class ProductControlFamily extends Family<AsyncValue<List<ProductModel>>> {
  /// See also [ProductControl].
  const ProductControlFamily();

  /// See also [ProductControl].
  ProductControlProvider call({
    int offset = 0,
    String title = "",
    int limit = FakeApiConst.apiQueryLimit,
  }) {
    return ProductControlProvider(
      offset: offset,
      title: title,
      limit: limit,
    );
  }

  @override
  ProductControlProvider getProviderOverride(
    covariant ProductControlProvider provider,
  ) {
    return call(
      offset: provider.offset,
      title: provider.title,
      limit: provider.limit,
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
  String? get name => r'productControlProvider';
}

/// See also [ProductControl].
class ProductControlProvider
    extends AsyncNotifierProviderImpl<ProductControl, List<ProductModel>> {
  /// See also [ProductControl].
  ProductControlProvider({
    int offset = 0,
    String title = "",
    int limit = FakeApiConst.apiQueryLimit,
  }) : this._internal(
          () => ProductControl()
            ..offset = offset
            ..title = title
            ..limit = limit,
          from: productControlProvider,
          name: r'productControlProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productControlHash,
          dependencies: ProductControlFamily._dependencies,
          allTransitiveDependencies:
              ProductControlFamily._allTransitiveDependencies,
          offset: offset,
          title: title,
          limit: limit,
        );

  ProductControlProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.offset,
    required this.title,
    required this.limit,
  }) : super.internal();

  final int offset;
  final String title;
  final int limit;

  @override
  FutureOr<List<ProductModel>> runNotifierBuild(
    covariant ProductControl notifier,
  ) {
    return notifier.build(
      offset: offset,
      title: title,
      limit: limit,
    );
  }

  @override
  Override overrideWith(ProductControl Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductControlProvider._internal(
        () => create()
          ..offset = offset
          ..title = title
          ..limit = limit,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        offset: offset,
        title: title,
        limit: limit,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<ProductControl, List<ProductModel>>
      createElement() {
    return _ProductControlProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductControlProvider &&
        other.offset == offset &&
        other.title == title &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, offset.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductControlRef on AsyncNotifierProviderRef<List<ProductModel>> {
  /// The parameter `offset` of this provider.
  int get offset;

  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `limit` of this provider.
  int get limit;
}

class _ProductControlProviderElement
    extends AsyncNotifierProviderElement<ProductControl, List<ProductModel>>
    with ProductControlRef {
  _ProductControlProviderElement(super.provider);

  @override
  int get offset => (origin as ProductControlProvider).offset;
  @override
  String get title => (origin as ProductControlProvider).title;
  @override
  int get limit => (origin as ProductControlProvider).limit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
