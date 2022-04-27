import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/business_logic/forgot_password/forgot_password_cubit.dart';
import 'package:coffepedia/data/repository/forgot_password_repository.dart';
import 'package:coffepedia/data/web_services/forgot_password_web_services.dart';
import 'package:coffepedia/main.dart';
import 'package:coffepedia/ui/screens/home_page.dart';
import 'package:coffepedia/ui/screens/intro/new_password_screen.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class OTPScreenProvider extends StatelessWidget {
  final String mobile;
  final bool isForgotPassword;

  const OTPScreenProvider({
    required this.mobile,
    this.isForgotPassword = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(
        ForgotPasswordRepository(
          ForgotPasswordWebServices(),
        ),
      ),
      child: OTPScreen(
        mobile: mobile,
        isForgotPassword: isForgotPassword,
      ),
    );
  }
}

class OTPScreen extends StatelessWidget {
  final String mobile;
  final bool isForgotPassword;
  OTPScreen({
    required this.mobile,
    required this.isForgotPassword,
    Key? key,
  }) : super(key: key);

  final TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is VerifyCodeIsSent) {
            print('amr1');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) {
                return HomePageProvider(
                  currentIndex: 0,
                );
              }),
            );
          } else if (state is VerifyCodeIsFalse) {
            print('amr2');

            BotToast.showText(text: state.error!.toString());
          } else if (state is VerifyNewPasswordIsSent) {
            print('amr3');

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) {
                return NewPasswordScreenProvider(otp: otp.text, mobile: mobile);
              }),
            );
          } else if (state is VerifyNewPasswordIsFalse) {
            print('amr4');

            BotToast.showText(text: state.error!.toString());
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20.w,
                  ),
                ),
                SizedBox(
                  height: 132.h,
                ),
                Text(
                  translator.translate("OTP_screen.verification_code"),
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 18.sp),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  '${translator.translate("OTP_screen.please_enter_code_sent_to_your_mobile_phone")} $mobile',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(
                  height: 36.h,
                ),
                Container(
                  height: 70.h,
                  child: PinInputTextField(
                    pinLength: 4,
                    decoration: BoxLooseDecoration(
                      textStyle: Theme.of(context).textTheme.subtitle1,
                      strokeColorBuilder: PinListenColorBuilder(
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColor,
                      ),
                    ),
                    controller: otp,
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.characters,
                    onSubmit: (pin) {},
                    onChanged: (pin) {},
                    enableInteractiveSelection: false,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                  builder: (context, state) {
                    return CustomButton(
                      title: translator.translate("OTP_screen.submit"),
                      onPress: () {
                        isForgotPassword
                            ? BlocProvider.of<ForgotPasswordCubit>(context)
                                .postVerifyNewPassword(mobile, otp.text)
                            : BlocProvider.of<ForgotPasswordCubit>(context)
                                .postVerifyOTP(mobile, otp.text);
                      },
                      height: 50.h,
                      width: 327.w,
                      borderRadius: 25.r,
                    );
                  },
                ),
                SizedBox(
                  height: 32.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    translator.translate("OTP_screen.receive_code"),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 14.sp),
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    translator.translate("OTP_screen.send_again"),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
