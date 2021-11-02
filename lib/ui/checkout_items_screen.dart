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
          child: Text("Proceed to checkout"),
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
                  Text("Shopping Basket"),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 24.6.h,
                      horizontal: 0,
                    ),
                    child: Text("Items (3 Item)"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemBuilder: (context, index) {
                    return CheckoutItem();
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(vertical: 15.75.h),
                      height: 1.h,
                      color: Color(0xff979797),
                    );
                  },
                  itemCount: 2,
                ),
              ),
            ),
            Container(
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
                  Text("Have a coupon?"),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Coupon code",
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
                          child: Text("Apply"),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal"),
                      Text("EGP 840"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Discount"),
                      Text("- EGP 120"),
                    ],
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
                        Text("Total price"),
                        Text("EGP 854"),
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
            ),
          ],
        ),
      ),
    );
  }
}
