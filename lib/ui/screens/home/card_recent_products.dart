import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
      width: 214.w,
      height: 170.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.0.r),
        image: DecorationImage(
          image: AssetImage(Assets.imagesCardWhite),
        ),
      ),
      //  child: Stack(
      //   children: [
      //     // Image.asset(
      //     //   Assets.imagesCard,
      //     //   height: 250.h,
      //     //   width: 214.w,
      //     // )
      //     Align(
      //       alignment: Alignment.bottomCenter,
      //       child: Container(
      //         height: 260.h,
      //         width: 214.w,
      //         decoration: BoxDecoration(
      //           boxShadow: [
      //             BoxShadow(
      //               color: Color.fromARGB(12, 0, 0, 0),
      //               blurRadius: 12,
      //               offset: Offset(0, 2),
      //             ),
      //           ],
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(
      //             11.r,
      //           ),
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       right: 17.w,
      //       child: Image.asset(
      //         Assets.imagesPack,
      //         width: 85.w,
      //         height: 156.h,
      //       ),
      //     ),
      //     Positioned(
      //       top: 52.h,
      //       left: 12.w,
      //       child: Row(
      //         children: [
      //           SvgPicture.asset(Assets.iconsStarActive),
      //           SizedBox(
      //             width: 5.w,
      //           ),
      //           Text('4.5'),
      //         ],
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 21.h,
      //       left: 12.w,
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Container(
      //             height: 17.h,
      //             width: 55.h,
      //             alignment: Alignment.center,
      //             decoration: BoxDecoration(
      //               color: Color(0xffFFD008),
      //               borderRadius: BorderRadius.only(
      //                   topLeft: Radius.circular(12.5.h),
      //                   bottomRight: Radius.circular(12.5.h),
      //                   bottomLeft: Radius.circular(12.5.h)),
      //             ),
      //             child: Text(
      //               '25% Off',
      //               style: Theme.of(context).textTheme.bodyText1,
      //             ),
      //           ),
      //           SizedBox(
      //             height: 15.h,
      //           ),
      //           Container(
      //             width: 140.w,
      //             child: Text(
      //               'CoffePedia Dark Espresso Roast COFFEE',
      //               style: Theme.of(context).textTheme.headline1!.copyWith(
      //                     fontSize: 14.sp,
      //                   ),
      //             ),
      //           ),
               
      //         ],
      //       ),
      //     ),
          
      //   ],
      // ),
    
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
              product_text.toString(),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14.sp),
            ),
          ),
        ],
      ),
    
    );
  }
}
