import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffepedia/ui/screens/product_screen.dart';
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
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ProductScreen();
          }),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 24.h),
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
      ),
    );
  }
}
