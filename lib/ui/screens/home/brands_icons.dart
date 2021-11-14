import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffepedia/ui/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsIcons extends StatelessWidget {
  const BrandsIcons({
    required this.brandIcon,
    Key? key,
  }) : super(key: key);

  final String brandIcon;

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
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: CachedNetworkImage(
          imageUrl: brandIcon,
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
