import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdSlider extends StatelessWidget {
  const AdSlider({
    required this.ad_image,
    this.onPress,
    Key? key,
  }) : super(key: key);
  final String ad_image;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: CachedNetworkImage(
        imageUrl: ad_image,
        imageBuilder: (context, imageProvider) => InkWell(
          onTap: () {
            onPress!();
          },
          child: Container(
            height: 170.h,
            width: 343.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0.r),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
