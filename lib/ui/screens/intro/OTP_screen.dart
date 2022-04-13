import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/business_logic/OTP/otp_cubit.dart';
import 'package:coffepedia/data/repository/otp_repository.dart';
import 'package:coffepedia/data/web_services/otp_web_services.dart';
import 'package:coffepedia/ui/screens/home_page.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class OTPScreenProvider extends StatelessWidget {
  final String mobile;

  const OTPScreenProvider({
    required this.mobile,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpCubit(
        OTPRepository(
          OTPWebServices(),
        ),
      ),
      child: OTPScreen(
        mobile: mobile,
      ),
    );
  }
}

class OTPScreen extends StatelessWidget {
  final String mobile;
  OTPScreen({
    required this.mobile,
    Key? key,
  }) : super(key: key);

  final TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<OtpCubit, OtpState>(
        listener: (context, state) {
          if (state is VerifyCodeIsSent) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePageProvider(
                  currentIndex: 0,
                ),
              ),
            );
          } else if (state is VerifyCodeIsFalse) {
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
                    Icons.chevron_left,
                    size: 24.w,
                  ),
                ),
                SizedBox(
                  height: 132.h,
                ),
                Text(
                  'Verification code',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 18.sp),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Please enter code sent to your mobile phone $mobile',
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
                BlocBuilder<OtpCubit, OtpState>(
                  builder: (context, state) {
                    return CustomButton(
                      title: "Submit",
                      onPress: () {
                        BlocProvider.of<OtpCubit>(context)
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
                    'Didn\'t receive a code?',
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
                    'Send Again',
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
