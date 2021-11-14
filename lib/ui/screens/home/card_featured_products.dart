import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/home/discount_container.dart';
import 'package:coffepedia/ui/screens/home/price_container.dart';
import 'package:coffepedia/ui/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        width: 214.w,
        height: 250.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.0.r),
          image: DecorationImage(
            image: AssetImage(Assets.imagesCardWhite),
          ),
        ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RateContainer(rate: 3.4),
                  Container(
                    child: CachedNetworkImage(
                      imageUrl: product_image,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 90.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                ),
            // discount container
            DiscountContainer(discount_text: "25% Off"),
            // product text
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                product_text,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14.sp),
              ),
            ),
              //price & fav icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PriceContainer(
                    price_after: "EGP 340",
                    price_before: "EGP 450",
                  )
                  //fav
                ],
              ),
                
          
            ],
          ),
        ),
    );
  }
}
