import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'rate_container.dart';

class CardRecentProducts extends StatelessWidget {
  const CardRecentProducts({
    required this.product_image,
    required this.product_text,
    Key? key,
  }) : super(key: key);
  final String product_image, product_text;

  @override
  Widget build(BuildContext context) {
     return Container(
       height: 187.h,
       child: Container(
        width: 214.w,
        height: 170.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11.0),
         image: DecorationImage(
        image: AssetImage(Assets.imagesCardWhite),
         ),
        ),
          child: Column(
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
              Container(
                    // margin: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Text(
                      product_text.toString() ,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
            ],
          ),
        ),
     );
  
  }
}
