import 'package:coffepedia/generated/assets.dart';
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
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        child: Image.asset(
          Assets.imagesPartnerLogo2,
          fit: BoxFit.contain,
        ),
        // CachedNetworkImage(
        //   imageUrl: brandIcon,
        //   imageBuilder: (context, imageProvider) => Container(
        //     height: 80.h,
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         image: imageProvider,
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
