import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../generated/l10n.dart';
import '../../common/app_style.dart';
import '../../common/model/fake_api_const.dart';
import '../control/product_control.dart';
import 'widget/custom_carouse_slider.dart';
import 'widget/product_tile.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  ValueNotifier<List<String?>> slider = ValueNotifier([]);
  Widget? productSearch;
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    _searchController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget child;

    productSearch ??= Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: _searchController,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: IconButton(
            onPressed: () async {
              scrollController.jumpTo(0);
              FocusManager.instance.primaryFocus?.unfocus();
              await ref
                  .read(productControlProvider(title: _searchController.text)
                      .notifier)
                  .getProductsByTitle(_searchController.text);
              setState(() {});
            },
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
              size: 24,
            ),
          ),
          hintText: S.of(context).search_hint,
          hintStyle: AppStyle.textSearchHint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onFieldSubmitted: (value) async {
          scrollController.jumpTo(0);
          FocusManager.instance.primaryFocus?.unfocus();
          await ref
              .read(productControlProvider(title: value).notifier)
              .getProductsByTitle(value);
          setState(() {});
        },
        onTap: () {
          _searchController.text = "";
        },
      ),
    );

    child = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          productSearch!,
          Column(
            children: [
              SizedBox(
                height: 200,
                child: ValueListenableBuilder(
                  valueListenable: slider,
                  builder: (context, value, _) {
                    return (value.isEmpty)
                        ? const Center(child: CircularProgressIndicator())
                        : CustomCarouseSlider(value);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(5),
              ),
              child: GridView.builder(
                controller: scrollController,
                padding: const EdgeInsets.only(top: 5),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  childAspectRatio: 10 / 14,
                ),
                itemBuilder: (_, index) {
                  final page = index ~/ FakeApiConst.apiQueryLimit;
                  final offset = page * FakeApiConst.apiQueryLimit;
                  final indexInPage = index % FakeApiConst.apiQueryLimit;
                  final productProvider = ref.watch(productControlProvider(
                      offset: offset, title: _searchController.text));
                  return productProvider.when(
                    data: (data) {
                      if (slider.value.isEmpty) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          final List<String?> images = [];
                          for (var product in data) {
                            images.add(product.images.firstOrNull);
                          }
                          slider.value = images;
                        });
                      }

                      if (indexInPage >= data.length) {
                        if (data.isEmpty && index == 0) {
                          return Center(
                            child: Text(
                              S.of(context).common_no_data,
                              style: AppStyle.textMediumBlack,
                            ),
                          );
                        } else {
                          return null;
                        }
                      }

                      return ProductTile(data[indexInPage]);
                    },
                    loading: () {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppStyle.progressIndicatorColor,
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
          ),
        ],
      ),
    );

    return RefreshIndicator(
      onRefresh: () async {
        _searchController.clear();
        ref.invalidate(productControlProvider());
        scrollController.jumpTo(0);
        ref.read(productControlProvider().notifier).getProductsByTitle("");
        setState(() {});
      },
      child: child,
    );
  }
}
