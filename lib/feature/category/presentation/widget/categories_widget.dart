import 'package:flutter/material.dart';

import 'category_tile.dart';
import '../../../home/model/product_model.dart';

class CategoriesWidget extends StatefulWidget {
  final List<CategoryModel> categories;

  const CategoriesWidget(this.categories, {super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  List<Widget> v = [];

  @override
  void initState() {
    List.generate(widget.categories.length, (index) {
      Future.delayed(Duration(seconds: index), () {
        setState(() {
          v.add(CategoryTile(widget.categories[index], (id) {
            final c = v.toList();
            for (var e in c) {
              if (e is CategoryTile) {
                if (e.categoryModel.id == id) {
                  setState(() {
                    v.remove(e);
                  });
                }
              }
            }
          }));
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget w;
    w = Column(children: v);

    return w;
  }
}
