import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesSplash),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Image.asset(
            Assets.iconsCoffePediaLogo,
            width: 199.w,
            height: 174.h,
          ),
        ),
      ),
    );
  }
}
