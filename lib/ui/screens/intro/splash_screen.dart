import 'package:coffepedia/business_logic/auth/auth_bloc.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/home_page.dart';
import 'package:coffepedia/ui/screens/intro/login_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        BlocProvider.of<AuthBloc>(context).add(AppStarted());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (_, state) {
        if (state is AuthenticationAuthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            ),
          );
        } else if (state is AuthenticationUnauthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LoginPage();
              },
            ),
          );
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
