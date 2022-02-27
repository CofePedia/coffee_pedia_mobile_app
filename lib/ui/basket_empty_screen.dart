import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/widgets/recommended_products_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasketEmptyScreen extends StatelessWidget {
  final bool isLoggedIn;
  const BasketEmptyScreen({required this.isLoggedIn});

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
              "My Basket",
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
              height: 100.h,
              padding: EdgeInsets.all(16.h),
              decoration: BoxDecoration(
                color: Color(0xffF3FCFE),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 23.sp,
                    child: SvgPicture.asset(
                      Assets.shoppingBasket,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Basket is Empty",
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
                          "You have no items in your shopping basket.",
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
                    "Recommended based on your shopping history",
                    maxLines: 2,
                    style: Theme.of(context).textTheme.caption,
                  ),
                )
              : SizedBox.shrink(),
          SizedBox(
            height: 23.h,
          ),
          (isLoggedIn) ? RecommendedProductsProvider() : SizedBox.shrink(),
        ],
      ),
    ));
  }
}
