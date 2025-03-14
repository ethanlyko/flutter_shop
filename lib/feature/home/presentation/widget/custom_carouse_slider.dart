import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

class CustomCarouseSlider extends StatelessWidget {
  final List<String?> items;
  const CustomCarouseSlider(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget w;

    w = Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5),
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: items.map((e) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl: e!,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  debugPrint("error url: $url");
                  return const Icon(
                    Icons.error,
                    size: 100,
                  );
                },
              ),
            ),
          );
        }).toList(),
      ),
    );

    return w;
  }
}
