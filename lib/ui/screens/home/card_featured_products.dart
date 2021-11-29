import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/product_screen.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardFeaturedProducts extends StatelessWidget {
  const CardFeaturedProducts({
    required this.productImage,
    required this.productText,
    Key? key,
  }) : super(key: key);
  final String productImage, productText;

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
        height: 262.h,
        width: 214.w,
        child: Stack(
          children: [
            Positioned(
              top: 13.h,
              child: Container(
                height: 250.h,
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
              child: Image.asset(
                Assets.imagesPack,
                width: 85.w,
                height: 156.h,
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
              top: 130.h,
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
                    height: 13.h,
                  ),
                  Container(
                    width: 192.w,
                    child: Text(
                      'Wonderful Pistachios, Sweet Chili Flavor, 14 Oun..',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 14.sp, height: 1.25),
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
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
              top: 208.h,
              right: 16.w,
              child: Container(
                height: 38.h,
                width: 38.w,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.12),
                        offset: Offset(0, 2),
                        blurRadius: 11.sp)
                  ],
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
