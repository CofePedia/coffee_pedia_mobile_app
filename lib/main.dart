import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/ui/shared/rating_bar.dart';
import 'package:coffepedia/ui/screens/filters_screen.dart';
import 'package:coffepedia/ui/screens/product_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ui/shared/custom_outline_button.dart';
import 'ui/screens/intro/splash_screen.dart';

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
          navigatorObservers: [BotToastNavigatorObserver()],
          home: SplashScreen(),
        );
      },
    );
  }
}
