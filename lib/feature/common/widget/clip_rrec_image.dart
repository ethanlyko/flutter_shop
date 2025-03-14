import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ClipRRectImage extends StatelessWidget {
  final String url;

  const ClipRRectImage(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: CachedNetworkImage(
        width: 100,
        imageUrl: url,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) {
          debugPrint("error url: $url");
          return Image.asset('assets/images/No_Image.jpg');
        },
      ),
    );
  }
}
