import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../generated/l10n.dart';
import '../../common/app_style.dart';
import '../control/favorite_control.dart';
import 'widget/favorite_item_widget.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget w;

    final favoriteProvider = ref.watch(favoriteControlProvider);

    w = favoriteProvider.when(
      data: (data) {
        Widget dataWidget;
        if (data.isEmpty) {
          dataWidget = Center(
            child: Text(S.of(context).common_no_data, style: AppStyle.textLarge),
          );
        } else {
          dataWidget = ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return FavoriteItemWidget(
                data[index],
              );
            },
          );
        }
        return dataWidget;
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (e, s) {
        return Center(child: Text(e.toString()));
      },
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: w,
    );
  }
}
