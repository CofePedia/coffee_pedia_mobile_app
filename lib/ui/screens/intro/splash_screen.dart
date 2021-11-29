import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/intro/login_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../checkout_popup.dart';
import '../../extension_method.dart';

import '../home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const LoginRegisterScreen();
            },
          ),
        );
      },
    );
    super.initState();
  }

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
