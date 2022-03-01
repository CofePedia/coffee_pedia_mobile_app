import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

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
                translator.translate("no_internet_screen.no_internet_text1"),
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                translator.translate("no_internet_screen.no_internet_text2"),
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                translator.translate("no_internet_screen.no_internet_text3"),
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
