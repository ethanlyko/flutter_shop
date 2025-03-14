import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/model/fake_api_const.dart';
import '../../home/repository/model/product.dart';
import '../../home/model/product_model.dart';
import '../../home/usecase/fake_service.dart';
import '../../common/model/api_result.dart';

part 'category_control.g.dart';

@Riverpod(keepAlive: true)
class CategoryControl extends _$CategoryControl {
  @override
  Future<List<ProductModel>> build({
    required int categoryId,
    int offset = 0,
    int limit = FakeApiConst.apiQueryLimit,
  }) async {
    final result = await ref.watch(fakeServiceProvider).getProductsByFilter({
      "categoryId": categoryId,
      "offset": offset,
      "limit": limit,
    });

    switch (result) {
      case Success<List<Product>>():
        return result.data
            .map((e) => ProductModel(
                  id: e.id,
                  title: e.title,
                  price: e.price,
                  description: e.description,
                  images: e.images,
                  creationAt: e.creationAt,
                  updatedAt: e.updatedAt,
                  category: CategoryModel(
                    id: e.category.id,
                    name: e.category.name,
                    image: e.category.image,
                    creationAt: e.category.creationAt,
                    updatedAt: e.category.updatedAt,
                  ),
                ))
            .toList();

      case Failure<List<Product>>():
        switch (result.e) {
          case ApiException():
            print(
                "ApiException: error=${(result.e as ApiException).errorCode}, msg=${(result.e as ApiException).message}");
            break;

          default:
            print(
                "failure result.e type: ${result.e.runtimeType}"); // ApiException
            break;
        }
    }

    return List.empty();
  }
}
