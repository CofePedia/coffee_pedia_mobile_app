import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            Text("My Basket"),
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
                      child: Image.asset(
                        Assets.iconsShoppingBasket,
                        width: 27.w,
                        height: 27.h,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your Basket is Empty"),
                        SizedBox(
                          height: 5.h,
                        ),
                        Expanded(
                          child: Text(
                            "You have no items in your shopping basket.",
                            maxLines: 2,
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
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 284.h,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  // TODO add child from after abeer push.

                  return Container(
                    width: 50.w,
                    height: 50.h,
                    color: Colors.yellow,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
