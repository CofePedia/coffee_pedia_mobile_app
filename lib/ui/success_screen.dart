import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Thank You",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              "Your Order Placed Successfully",
              style: Theme.of(context).textTheme.caption,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: SvgPicture.asset(
                Assets.imagesSuccsign,
                width: 102.w,
                height: 102.h,
              ),
            ),
            Text(
              "Order ID #CP6786563722021",
              style: Theme.of(context).textTheme.caption,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: Text(
                "You will recieve an email with your order details and the expecting shipping date",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 22.h, bottom: 7.h),
              height: 50.h,
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
                  "Track your order",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Continue Shopping",
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
