import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/home/card_featured_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasketEmptyScreen extends StatelessWidget {
  const BasketEmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 60.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Basket",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.black,
                  ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 31.h, bottom: 45.h),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 93.h,
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
                      backgroundColor: Color(0xffD2F9FF),
                      child: SvgPicture.asset(
                        Assets.iconsShoppingBasket,
                        width: 27.w,
                        height: 27.h,
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
            Text(
              "Recommended based on your shopping history",
              maxLines: 2,
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(
              height: 23.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 284.h,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return FeaturedProducts(
                    // productImage:
                    //     "https://www.philips.sa/c-dam/b2c/category-pages/Household/coffee/master/philips-superautomatic/mea-2017/HD8651.png",
                    // productText:
                    //     "Wonderful Pistachios, Sweet Chili Flavor, 14 Ounc",
                    // rate: '4.5',
                    // percentage: '25',
                    // priceAfterDiscount: '340',
                    // priceBeforeDiscount: '450',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
