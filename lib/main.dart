import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/ui/screens/my_wallet_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then(
    (value) {
      runApp(
        EasyLocalization(
          supportedLocales: [
            Locale('en'),
            Locale('ar'),
          ],
          path: 'assets/translations',
          fallbackLocale: Locale('en'),
          child: MyApp(),
        ),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () {
        return MaterialApp(
          title: 'Coffe Pedia',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          builder: BotToastInit(),
          navigatorObservers: [
            BotToastNavigatorObserver(),
          ],
          home: MyWalletScreen(),
          theme: ThemeData(
            accentColor: Color(0xffffffff),
            primaryColor: Color(0xff107CC0),
            textTheme: TextTheme(
              bodyText1: TextStyle(
                fontFamily: 'Nexa',
                fontSize: 10.sp,
                color: Color(0xff231F20),
                fontWeight: FontWeight.w700,
              ),
              bodyText2: TextStyle(
                fontFamily: 'Nexa',
                fontSize: 12.sp,
                color: Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              subtitle1: TextStyle(
                fontFamily: 'Nexa',
                fontSize: 18.sp,
                color: Color(0xff4470C1),
                fontWeight: FontWeight.w700,
              ),
              headline2: TextStyle(
                fontFamily: 'Nexa',
                fontSize: 14.sp,
                color: Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
              subtitle2: TextStyle(
                fontFamily: 'Nexa',
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                height: 1.5,
                color: Color(0xff231F20),
              ),
              headline1: TextStyle(
                fontFamily: 'Nexa',
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff000000),
              ),
              headline3: TextStyle(
                fontFamily: 'Nexa',
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff8A8A8A),
              ),
              headline4: TextStyle(
                fontFamily: 'Nexa',
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff606266),
                height: 1.5.sp,
              ),
              headline5: TextStyle(
                fontFamily: 'Nexa',
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xffF3AE16),
              ),
              headline6: TextStyle(
                fontFamily: 'Nexa',
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff107CC0),
              ),
              caption: TextStyle(
                fontFamily: 'Nexa',
                fontSize: 16.sp,
                fontWeight: FontWeight.w900,
                color: Color(0xff231F20),
              ),
              overline: TextStyle(
                fontFamily: 'Nexa',
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff9D9D9D),
              ),
            ),
          ),
        );
      },
    );
  }
}
