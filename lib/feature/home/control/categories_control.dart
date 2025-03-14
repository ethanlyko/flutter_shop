import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/model/product.dart';
import '../model/product_model.dart';
import '../usecase/fake_service.dart';
import '../../common/model/api_result.dart';

part 'categories_control.g.dart';

@Riverpod(keepAlive: true)
class CategoriesControl extends _$CategoriesControl {
  @override
  Future<List<CategoryModel>> build() async {
    final result = await ref.watch(fakeServiceProvider).getCategories();

    switch (result) {
      case Success<List<Category>>():
        return result.data
            .map((e) => CategoryModel(
                  id: e.id,
                  name: e.name,
                  image: e.image,
                  creationAt: e.creationAt,
                  updatedAt: e.updatedAt,
                ))
            .toList();

      case Failure<List<Category>>():
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
    }

    return List.empty();
  }
}
