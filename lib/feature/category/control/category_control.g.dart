// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_control.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryControlHash() => r'fc3b90a2c1a1c555c941c8b31945e560e36612f9';

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

abstract class _$CategoryControl
    extends BuildlessAsyncNotifier<List<ProductModel>> {
  late final int categoryId;
  late final int offset;
  late final int limit;

  FutureOr<List<ProductModel>> build({
    required int categoryId,
    int offset = 0,
    int limit = FakeApiConst.apiQueryLimit,
  });
}

/// See also [CategoryControl].
@ProviderFor(CategoryControl)
const categoryControlProvider = CategoryControlFamily();

/// See also [CategoryControl].
class CategoryControlFamily extends Family<AsyncValue<List<ProductModel>>> {
  /// See also [CategoryControl].
  const CategoryControlFamily();

  /// See also [CategoryControl].
  CategoryControlProvider call({
    required int categoryId,
    int offset = 0,
    int limit = FakeApiConst.apiQueryLimit,
  }) {
    return CategoryControlProvider(
      categoryId: categoryId,
      offset: offset,
      limit: limit,
    );
  }

  @override
  CategoryControlProvider getProviderOverride(
    covariant CategoryControlProvider provider,
  ) {
    return call(
      categoryId: provider.categoryId,
      offset: provider.offset,
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
  String? get name => r'categoryControlProvider';
}

/// See also [CategoryControl].
class CategoryControlProvider
    extends AsyncNotifierProviderImpl<CategoryControl, List<ProductModel>> {
  /// See also [CategoryControl].
  CategoryControlProvider({
    required int categoryId,
    int offset = 0,
    int limit = FakeApiConst.apiQueryLimit,
  }) : this._internal(
          () => CategoryControl()
            ..categoryId = categoryId
            ..offset = offset
            ..limit = limit,
          from: categoryControlProvider,
          name: r'categoryControlProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryControlHash,
          dependencies: CategoryControlFamily._dependencies,
          allTransitiveDependencies:
              CategoryControlFamily._allTransitiveDependencies,
          categoryId: categoryId,
          offset: offset,
          limit: limit,
        );

  CategoryControlProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
    required this.offset,
    required this.limit,
  }) : super.internal();

  final int categoryId;
  final int offset;
  final int limit;

  @override
  FutureOr<List<ProductModel>> runNotifierBuild(
    covariant CategoryControl notifier,
  ) {
    return notifier.build(
      categoryId: categoryId,
      offset: offset,
      limit: limit,
    );
  }

  @override
  Override overrideWith(CategoryControl Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryControlProvider._internal(
        () => create()
          ..categoryId = categoryId
          ..offset = offset
          ..limit = limit,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
        offset: offset,
        limit: limit,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<CategoryControl, List<ProductModel>>
      createElement() {
    return _CategoryControlProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryControlProvider &&
        other.categoryId == categoryId &&
        other.offset == offset &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);
    hash = _SystemHash.combine(hash, offset.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryControlRef on AsyncNotifierProviderRef<List<ProductModel>> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;

  /// The parameter `offset` of this provider.
  int get offset;

  /// The parameter `limit` of this provider.
  int get limit;
}

class _CategoryControlProviderElement
    extends AsyncNotifierProviderElement<CategoryControl, List<ProductModel>>
    with CategoryControlRef {
  _CategoryControlProviderElement(super.provider);

  @override
  int get categoryId => (origin as CategoryControlProvider).categoryId;
  @override
  int get offset => (origin as CategoryControlProvider).offset;
  @override
  int get limit => (origin as CategoryControlProvider).limit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
