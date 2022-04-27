import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
      {required this.imageUrl,
      required this.height,
      required this.width,
      required this.radius,
      this.fit,
      Key? key})
      : super(key: key);
  final double height;
  final double width;
  final double radius;
  final String imageUrl;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                image: DecorationImage(
                  image: imageProvider, fit: fit ?? BoxFit.fill,

                  // fit: BoxFit.cover,
                ),
              ),
            ),
        errorWidget: (context, url, error) => const Icon(Icons.broken_image),
        placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ));
  }
}
