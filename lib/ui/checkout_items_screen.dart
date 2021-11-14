import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'checkout_item.dart';

class CheckoutItemsScreen extends StatelessWidget {
  const CheckoutItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 92.h,
        padding: EdgeInsets.symmetric(
          vertical: 21.h,
          horizontal: 15.w,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.r),
            topRight: Radius.circular(22.r),
          ),
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r),
              ),
            ),
          ),
          child: Text(
            "Proceed to checkout",
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shopping Basket",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 24.6.h,
                      horizontal: 0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Items",
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "(3 Item)",
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                                color: Colors.black,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    if (index == 2) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xffF8F8F8),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Have a coupon?",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Coupon code",
                                  hintStyle: Theme.of(context).textTheme.headline4!.copyWith(
                                        color: Color(0xffcccccc),
                                      ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.w),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 0,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.w),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 0,
                                    ),
                                  ),
                                  suffixIcon: Container(
                                    width: 90.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(5.r),
                                        topRight: Radius.circular(5.r),
                                      ),
                                      color: Color(0xff107CC0),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Apply",
                                      style: Theme.of(context).textTheme.headline2!.copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Subtotal", style: Theme.of(context).textTheme.headline4),
                                Text("EGP 840", style: Theme.of(context).textTheme.headline4),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Discount", style: Theme.of(context).textTheme.headline4),
                                Text("- EGP 120", style: Theme.of(context).textTheme.headline4),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Delivery charge"),
                                Text("+ EGP 50"),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16.h, bottom: 28.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total price", style: Theme.of(context).textTheme.headline4),
                                  Text("EGP 854", style: Theme.of(context).textTheme.headline4),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Assets.imagesVisaLogo,
                                  width: 53.w,
                                  height: 25.h,
                                ),
                                SizedBox(
                                  width: 7.w,
                                ),
                                SvgPicture.asset(
                                  Assets.imagesMastercardLogo,
                                  width: 44.w,
                                  height: 28.h,
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: CheckoutItem(),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(vertical: 15.75.h),
                      height: 1.h,
                      color: Color(0xff979797),
                    );
                  },
                  itemCount: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
