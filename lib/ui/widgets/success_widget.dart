import 'package:coffepedia/business_logic/basket/basket_cubit.dart';
import 'package:coffepedia/data/repository/basket_repository.dart';
import 'package:coffepedia/data/web_services/basket_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/main.dart';
import 'package:coffepedia/ui/screens/home_page.dart';
import 'package:coffepedia/ui/screens/orders_history_screen.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SuccessWidgetProvider extends StatelessWidget {
  final String message;
  final String orderId;
  const SuccessWidgetProvider(
      {required this.message, required this.orderId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BasketCubit(
        BasketRepository(
          BasketWebServices(),
        ),
      ),
      child: SuccessWidget(
        orderId: orderId,
        message: message,
      ),
    );
  }
}

class SuccessWidget extends StatelessWidget {
  final String message;
  final String orderId;
  const SuccessWidget({
    required this.message,
    required this.orderId,
    Key? key,
  }) : super(key: key);

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
              translator.translate("success_screen.thank_you"),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 22.sp,
                  ),
            ),
            SizedBox(
              height: 17.h,
            ),
            Text(
              message,
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
              orderId,
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              translator.translate("success_screen.success_msg"),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 12.sp,
                  ),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomButton(
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OrdersHistoryProvider();
                    },
                  ),
                );
              },
              title: translator.translate("success_screen.track_order"),
              height: 50.h,
              width: 345.w,
              imageWidth: 0,
              imageHeight: 0,
              // buttonColor: Theme.of(context).primaryColor,
              borderRadius: 25.sp,
              imageColor: Colors.transparent,
            ),
            SizedBox(
              height: 12.h,
            ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomePageProvider(
                        currentIndex: 0,
                      );
                    },
                  ),
                  ModalRoute.withName('/'),
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return const HomePageProvider(currentIndex: 0);
                //     },
                //   ),
                // );
              },
              child: Text(
                translator.translate("success_screen.continue_shopping"),
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
