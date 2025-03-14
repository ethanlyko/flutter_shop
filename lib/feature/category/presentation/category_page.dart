import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/app_style.dart';
import 'widget/categories_widget.dart';
import '../../home/control/categories_control.dart';

class CategoryPage extends ConsumerWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesControlProvider);

    Widget w;

    w = categories.when(
      data: (data) {
        return CategoriesWidget(data);
      },
      loading: () {
        return Padding(
          padding: const EdgeInsets.only(top: 50),
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

    w = Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: w,
          ),
        ),
      ],
    );

    return w;
  }
}
