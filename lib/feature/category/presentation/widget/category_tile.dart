import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/app_style.dart';
import '../../../home/model/product_model.dart';
import '../../../common/model/fake_api_const.dart';
import '../../../home/presentation/widget/product_tile.dart';
import '../../control/category_control.dart';

class CategoryTile extends ConsumerWidget {
  final CategoryModel categoryModel;
  final Function onDismiss;
  const CategoryTile(this.categoryModel, this.onDismiss, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget w;

    w = Column(
      children: [
        const SizedBox(height: 10),
        Container(
          color: AppStyle.containerBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  categoryModel.name,
                  style: AppStyle.textMedium,
                ),
              ),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final page = index ~/ FakeApiConst.apiQueryLimit;
                    final offset = page * FakeApiConst.apiQueryLimit;
                    final indexInPage = index % FakeApiConst.apiQueryLimit;
                    final category = ref.watch(categoryControlProvider(
                        categoryId: categoryModel.id, offset: offset));
                    return category.when(
                      data: (data) {
                        if (data.isEmpty) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            onDismiss(categoryModel.id);
                          });
                        }

                        if (data.isEmpty || indexInPage >= data.length) {
                          return null;
                        }

                        return SizedBox(
                          width: 200,
                          child: ProductTile(data[indexInPage]),
                        );
                      },
                      loading: () {
                        return SizedBox(
                          width: 200,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppStyle.progressIndicatorColor,
                            ),
                          ),
                        );
                      },
                      error: (e, s) {
                        return Center(child: Text(e.toString()));
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );

    return w;
  }
}
