import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../generated/l10n.dart';
import '../../../common/app_style.dart';
import '../../control/product_control.dart';

class ProductSearch extends ConsumerStatefulWidget {
  final Function() onClick;

  const ProductSearch({required this.onClick, super.key});

  @override
  ConsumerState<ProductSearch> createState() => _ProductSearchState();
}

class _ProductSearchState extends ConsumerState<ProductSearch> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget w;

    w = Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: _searchController,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: IconButton(
            onPressed: () {
              if (_searchController.text.isNotEmpty) {
                ref
                    .read(productControlProvider(title: _searchController.text)
                        .notifier)
                    .getProductsByTitle(_searchController.text);
                FocusManager.instance.primaryFocus?.unfocus();
                widget.onClick();
              }
            },
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
              size: 24,
            ),
          ),
          hintText: S.of(context).search_hint,
          hintStyle: AppStyle.textMedium,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onFieldSubmitted: (value) {
          if (value.isNotEmpty) {
            ref.invalidate(productControlProvider());
            ref
                .read(productControlProvider(title: value).notifier)
                .getProductsByTitle(value);
            FocusManager.instance.primaryFocus?.unfocus();
            widget.onClick();
          }
        },
        onTap: () {
          _searchController.text = "";
        },
      ),
    );

    return w;
  }
}
