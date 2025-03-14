import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/model/fake_api_const.dart';
import '../repository/model/product.dart';
import '../model/product_model.dart';
import '../usecase/fake_service.dart';
import '../../common/model/api_result.dart';

part 'product_control.g.dart';

@Riverpod(keepAlive: true)
class ProductControl extends _$ProductControl {
  int categoryId = -1;
  static String queryTitle = "";

  @override
  Future<List<ProductModel>> build({
    int offset = 0,
    String title = "",
    int limit = FakeApiConst.apiQueryLimit,
  }) async {
    queryTitle = title;
    final queries = (categoryId != -1)
        ? {
            "categoryId": categoryId,
            "title": queryTitle,
            "offset": offset,
            "limit": limit,
          }
        : {
            "title": queryTitle,
            "offset": offset,
            "limit": limit,
          };
    final products = await _getProducts(
        ref.watch(fakeServiceProvider).getProductsByFilter, queries);

    return products;
  }

  getProductsByTitle(
    String title, {
    int offset = 0,
    int limit = FakeApiConst.apiQueryLimit,
  }) async {
    queryTitle = title;
    final queries = (categoryId != -1)
        ? {
            "categoryId": categoryId,
            "title": queryTitle,
            "offset": offset,
            "limit": limit,
          }
        : {
            "title": queryTitle,
            "offset": offset,
            "limit": limit,
          };
    final products = await _getProducts(
        ref.watch(fakeServiceProvider).getProductsByFilter, queries);

    state = AsyncData(products);
  }

  getProductsByCategory(
    int categoryId, {
    int offset = 0,
    int limit = FakeApiConst.apiQueryLimit,
  }) async {
    this.categoryId = categoryId;
    final queries = (categoryId != -1)
        ? {
            "categoryId": categoryId,
            "title": queryTitle,
            "offset": offset,
            "limit": limit,
          }
        : {
            "title": queryTitle,
            "offset": offset,
            "limit": limit,
          };
    final products = await _getProducts(
        ref.watch(fakeServiceProvider).getProductsByFilter, queries);

    state = AsyncData(products);
  }

  Future<List<ProductModel>> _getProducts(
      Future<ApiResult<List<Product>>> Function(Map<String, dynamic>) fn,
      Map<String, dynamic> queries) async {
    final result = await fn(queries);

    switch (result) {
      case Success<List<Product>>():
        final products = result.data.map((e) {
          final images = e.images.map((image) {
            return image
                .replaceAll("\"", "")
                .replaceAll("[", "")
                .replaceAll("]", "");
          }).toList();

          return ProductModel(
            id: e.id,
            title: e.title,
            price: e.price,
            description: e.description,
            images: images,
            creationAt: e.creationAt,
            updatedAt: e.updatedAt,
            category: CategoryModel(
              id: e.category.id,
              name: e.category.name,
              image: e.category.image,
              creationAt: e.category.creationAt,
              updatedAt: e.category.updatedAt,
            ),
          );
        }).toList();

        return products;

      case Failure<List<Product>>():
        switch (result.e) {
          case ApiException():
            print(
                "ApiException: error=${(result.e as ApiException).errorCode}, msg=${(result.e as ApiException).message}");
            break;

          default:
            print(
                "failure result.e type: ${result.e.runtimeType}");
            break;
        }
        return List.empty();
    }
  }
}
