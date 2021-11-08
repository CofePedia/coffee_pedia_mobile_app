import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardFeaturedProducts extends StatelessWidget {
  const CardFeaturedProducts({
    required this.product_image,
    required this.product_text,
    required this.price_after,
    required this.price_before,
    required this.discount,
    required this.fav,
    this.rate,
    Key? key,
  }) : super(key: key);
  final String product_image, product_text, price_after, price_before , discount;
  final double? rate;
  final bool fav;

  @override
  Widget build(BuildContext context) {
      return Container(
      width: 214.w,
      height: 250.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(11.0),
    image: DecorationImage(
      image: AssetImage(Assets.productCardWhite),
    ),
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                 child: Text(rate.toString(),
                 style: TextStyle(fontSize: 12.sp , color: Colors.black),
                 )
                ),
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
            Container(
              height: 17.h,
              width: 55.w,
              decoration: BoxDecoration(
                color: Colors.yellow,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.5) , bottomRight: Radius.circular(12.5) , topLeft: Radius.circular(12.5) , topRight: Radius.zero),
              ),
              child: Text( 
                discount,
                style: TextStyle(
                  fontSize: 10.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // product text
            Container(
                  // margin: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Text(
                    product_text ,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                //price & fav icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                   children: [
                     Container(
                       child: Text(price_before,
                       style: TextStyle(
                         fontSize: 12.sp,
                         color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                       ),
                       textAlign: TextAlign.start,
                       ),
                     ),
                     Text(price_after,
                     style: TextStyle(
                       fontSize: 16.sp,
                       color: Colors.blue,
                     ),
                     textAlign: TextAlign.start,
                     )
                   ],
                  ),
                  //fav

                ],
              )
          ],
        ),
      );
  
  }
}
