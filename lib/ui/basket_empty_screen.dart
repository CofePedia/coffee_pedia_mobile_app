import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/widgets/recommended_products_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';

class BasketEmptyScreen extends StatelessWidget {
  final bool isLoggedIn;
  final Function onAddTapped;

  BasketEmptyScreen({required this.onAddTapped, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
        screen: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60.h, right: 16.w, left: 16.w),
            child: Text(
              translator.translate("basket_empty.my_basket"),
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 31.h, bottom: 45.h, left: 16.w, right: 16.w),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 118.h,
              padding: EdgeInsets.all(16.h),
              decoration: BoxDecoration(
                color: Color(0xffF3FCFE),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 23.sp,
                    child: SvgPicture.asset(
                      Assets.shoppingBasket,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translator.translate("basket_empty.basket_is_empty"),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black,
                            ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        width: 211.w,
                        child: Text(
                          translator.translate(
                              "basket_empty.no_items_in_basket_text"),
                          maxLines: 2,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 48.h,
          ),
          (isLoggedIn)
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    translator.translate("basket_empty.recommended_text"),
                    maxLines: 2,
                    style: Theme.of(context).textTheme.caption,
                  ),
                )
              : SizedBox.shrink(),
          SizedBox(
            height: 23.h,
          ),
          (isLoggedIn)
              ? RecommendedProductsProvider(
                  onAddTapped: onAddTapped,
                )
              : SizedBox.shrink(),
        ],
      ),
    ));
  }
}
