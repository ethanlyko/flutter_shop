import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../common/app_style.dart';
import '../../../common/widget/clip_rrec_image.dart';
import '../../../realm/model/app.dart';
import '../../../realm/realm_manager.dart';

class FavoriteItemWidget extends StatefulWidget {
  final FavoriteRealm product;
  const FavoriteItemWidget(this.product, {super.key});

  @override
  State<FavoriteItemWidget> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItemWidget> {
  final ValueNotifier<bool> _favorite = ValueNotifier(true);
  FavoriteRealm? object;

  @override
  void initState() {
    object = FavoriteRealm(
      const Uuid().v4(),
      widget.product.productId,
      widget.product.title,
      widget.product.price,
      widget.product.description,
      images: widget.product.images,
    );
    super.initState();
  }

  _toggleFavorite() {
    _favorite.value = !_favorite.value;
    if (_favorite.value) {
      RealmManager().createFavorite(object!);
    } else {
      RealmManager().deleteFavorite(widget.product);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget w;

    String? url = widget.product.images[0];
    url ??= "";

    w = Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: AppStyle.yellowColor.withOpacity(0.9),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRectImage(url),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "\$ ${widget.product.price}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ValueListenableBuilder(
                            valueListenable: _favorite,
                            builder: (context, value, _) {
                              return IconButton(
                                onPressed: () => _toggleFavorite(),
                                icon: const Icon(Icons.favorite, size: 32),
                                color: (value) ? Colors.cyan : Colors.white,
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.product.description,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );

    return w;
  }
}
