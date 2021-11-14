import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/home/discount_container.dart';
import 'package:coffepedia/ui/screens/home/price_container.dart';
import 'package:coffepedia/ui/screens/product_screen.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'rate_container.dart';

class CardFeaturedProducts extends StatelessWidget {
  const CardFeaturedProducts({
    required this.product_image,
    required this.product_text,
    Key? key,
  }) : super(key: key);
  final String product_image, product_text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductScreen();
            },
          ),
        );
      },
      child: Container(
        height: 286.h,
        width: 214.w, margin: EdgeInsets.symmetric(horizontal: 12.w),

        //  color: Colors.blue,
        child: Stack(
          children: [
            // Image.asset(
            //   Assets.imagesCard,
            //   height: 250.h,
            //   width: 214.w,
            // )
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 260.h,
                width: 214.w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(12, 0, 0, 0),
                      blurRadius: 12,
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
              child: Image.asset(
                Assets.imagesPack,
                width: 85.w,
                height: 156.h,
              ),
            ),
            Positioned(
              top: 52.h,
              left: 12.w,
              child: Row(
                children: [
                  SvgPicture.asset(Assets.iconsStarActive),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text('4.5'),
                ],
              ),
            ),
            Positioned(
              bottom: 21.h,
              left: 12.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 17.h,
                    width: 55.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xffFFD008),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.5.h),
                          bottomRight: Radius.circular(12.5.h),
                          bottomLeft: Radius.circular(12.5.h)),
                    ),
                    child: Text(
                      '25% Off',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    width: 140.w,
                    child: Text(
                      'CoffePedia Dark Espresso Roast COFFEE',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 14.sp,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'EGP 450',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black45,
                        ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'EGP 340',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 21.h,
              right: 16.w,
              child: Container(
                height: 38.h,
                width: 38.w,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.12), offset: Offset(0, 2), blurRadius: 11.sp)],
                ),
                child: FavoriteButton(
                  isFavorite: true,
                  iconSize: 35.h,
                  iconColor: Color(0xffE02020),
                  valueChanged: (_isFavorite) {
                    print('Is Favorite $_isFavorite)');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
