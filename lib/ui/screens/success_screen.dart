import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/home_screen.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Thank You',
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 22.sp,
                  ),
            ),
            SizedBox(
              height: 17.h,
            ),
            Text(
              'Your Order Placed Successfully',
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(
              height: 24.h,
            ),
            SvgPicture.asset(
              Assets.successIcon,
              height: 102.h,
              width: 102.w,
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Order ID #CP6786563722021',
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              'You will recieve an email with your order details and the expecting shipping date',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 12.sp,
                  ),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomButton(
              onPress: () {},
              title: 'Track your order',
              height: 50.h,
              width: 345.w,
              imageWidth: 0,
              imageHeight: 0,
              buttonColor: Theme.of(context).primaryColor,
              borderRadius: 25.sp,
              imageColor: Colors.transparent,
            ),
            SizedBox(
              height: 12.h,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreenProvider();
                    },
                  ),
                );
              },
              child: Text(
                'Continue Shopping',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Color(0xff007CC6),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
