import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.noInternetConnectionImage),
              SizedBox(
                height: 32.h,
              ),
              Text(
                'No internet connection',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'System is offline and orders will not received,',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Please check your internet connection and try again.',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 32.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
