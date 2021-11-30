import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CardRecentProducts extends StatelessWidget {
  const CardRecentProducts({
    required this.productImage,
    required this.productText,
    Key? key,
  }) : super(key: key);
  final String productImage, productText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 187.h,
        width: 214.w,
        child: Stack(
          children: [
            Positioned(
              top: 17.h,
              child: Container(
                height: 170.h,
                width: 214.w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.12),
                      blurRadius: 11.r,
                      offset: Offset(0, 2),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    11.r,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 17.w,
              child: Container(
                child: Image.asset(
                  productImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 28.h,
              left: 12.w,
              child: Row(
                children: [
                  SvgPicture.asset(Assets.iconsStarActive),
                  SizedBox(
                    width: 6.14.w,
                  ),
                  Text('4.5'),
                ],
              ),
            ),
            Positioned(
              top: 123.h,
              left: 12.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 13.h,
                  ),
                  Container(
                    width: 192.w,
                    child: Text(
                      productText,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 14.sp, height: 1.25),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
