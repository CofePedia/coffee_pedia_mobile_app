import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/main.dart';
import 'package:coffepedia/ui/screens/home_page.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FailedPaymentWidget extends StatelessWidget {
  final String message;
  final String orderId;
  const FailedPaymentWidget(
      {required this.message, required this.orderId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                translator
                    .translate("failed_payment_screen.Transaction Failed"),
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
              Container(
                child: Image.asset(
                  Assets.paymentFiledIcon,
                  height: 102.h,
                  width: 102.w,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                translator.translate("failed_payment_screen.Failed_msg"),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 12.sp,
                    ),
              ),
              Text(
                translator.translate("failed_payment_screen.Try_again_msg"),
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
                        return const HomePageProvider(currentIndex: 0);
                      },
                    ),
                  );
                },
                title:
                    translator.translate("failed_payment_screen.back_to_home"),
                height: 50.h,
                width: 345.w,
                imageWidth: 0,
                imageHeight: 0,
                // buttonColor: Theme.of(context).primaryColor,
                borderRadius: 25.sp,
                imageColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
