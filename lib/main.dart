import 'package:appmetrica_sdk/appmetrica_sdk.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/business_logic/login/login_bloc.dart';
import 'package:coffepedia/data/repository/user_repository.dart';
import 'package:coffepedia/services/preferences.dart';
import 'package:coffepedia/services/restart.dart';
import 'package:coffepedia/services/translator.dart';
import 'package:coffepedia/ui/screens/intro/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pushwoosh/pushwoosh.dart';

import 'business_logic/auth/auth_bloc.dart';
import 'data/web_services/auth_web_services.dart';

late Translator translator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Pushwoosh.initialize({"app_id": "110FF-9CE72", "sender_id": "177929575410"});
  Pushwoosh.getInstance.registerForPushNotifications();
  await Firebase.initializeApp();

  await AppmetricaSdk()
      .activate(apiKey: '315bc60f-eca2-4714-882c-57bd59719f9c');

  await Prefs.init();
  translator = Translator();
  await translator.init();

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
          child: RestartWidget(
            child: RepositoryProvider(
              create: (_) {
                return UserRepository(AuthWebServices());
              },
              child: BlocProvider(
                create: (_) => AuthBloc(
                  RepositoryProvider.of<UserRepository>(_),
                ),
                child: MyApp(),
              ),
            ),
          ),
        ),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () {
        return MultiBlocProvider(
          providers: [
            BlocProvider<LoginBloc>(
              create: (_) => LoginBloc(
                authBloc: BlocProvider.of<AuthBloc>(context),
                userRepository: RepositoryProvider.of<UserRepository>(context),
              ),
            ),
          ],
          child: MaterialApp(
            title: 'CofePedia',
            localizationsDelegates: translator.delegates,
            locale: translator.locale,
            supportedLocales: translator.locals(),
            debugShowCheckedModeBanner: false,
            builder: BotToastInit(),
            navigatorObservers: <NavigatorObserver>[observer],

            // navigatorObservers: [
            //   BotToastNavigatorObserver(),
            //   // AnalyticsService.observer,
            // ],
            home: SplashScreen(),
            // home: HomePage(
            //   currentIndex: 0,
            // ),
            /*SplashScreen()*/
            theme: ThemeData(
              colorScheme: ThemeData().colorScheme.copyWith(
                    secondary: Color(0xffffffff),
                  ),
              primaryColor: Color(0xff107CC0),
              fontFamily:
                  translator.currentLanguage == 'ar' ? 'FrutigerLT' : 'Nexa',
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 10.sp,
                  color: Color(0xff231F20),
                  fontWeight: FontWeight.w700,
                ),
                bodyText2: TextStyle(
                  fontSize: 12.sp,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w500,
                ),
                subtitle1: TextStyle(
                  fontSize: 18.sp,
                  color: Color(0xff4470C1),
                  fontWeight: FontWeight.w700,
                ),
                headline2: TextStyle(
                  fontSize: 14.sp,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
                subtitle2: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                  color: Color(0xff231F20),
                ),
                headline1: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff000000),
                ),
                headline3: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff8A8A8A),
                ),
                headline4: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff606266),
                  height: 1.5.sp,
                ),
                headline5: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffF3AE16),
                ),
                headline6: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff107CC0),
                ),
                caption: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w900,
                  color: Color(0xff231F20),
                ),
                overline: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff9D9D9D),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
