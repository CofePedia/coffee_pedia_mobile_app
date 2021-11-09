import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Ads extends StatelessWidget {
  const Ads({
    required this.ad_image_background,
    this.onPress,
    Key? key,
  }) : super(key: key);
  final ad_image_background;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: ad_image_background,
        imageBuilder: (context, imageProvider) => InkWell(
              onTap: () {
                onPress!();
              },
              child: Container(
                height: 205.h,
                width: 344.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.0),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ));
  }
}
