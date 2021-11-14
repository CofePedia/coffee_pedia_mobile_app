import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdBanner extends StatelessWidget {
  const AdBanner({
    required this.adImageBackground,
    this.onPress,
    Key? key,
  }) : super(key: key);
  final adImageBackground;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: adImageBackground,
        imageBuilder: (context, imageProvider) => InkWell(
              onTap: () {
                onPress!();
              },
              child: Container(
                height: 60.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ));
  }
}
