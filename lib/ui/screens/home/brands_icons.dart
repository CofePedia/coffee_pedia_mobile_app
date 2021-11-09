import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsIcons extends StatelessWidget {
  const BrandsIcons({
    required this.brand_icon,
    Key? key,
  }) : super(key: key);

  final String brand_icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: CachedNetworkImage(
                imageUrl: brand_icon,
                imageBuilder: (context, imageProvider) => Container(
                  height: 80.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
    );
  }
}
