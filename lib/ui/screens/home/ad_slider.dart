import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdSlider extends StatelessWidget {
  const AdSlider({
    required this.adImage,
    this.onPress,
    Key? key,
  }) : super(key: key);
  final String adImage;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: CachedNetworkImage(
        imageUrl: adImage,
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
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
