import 'package:coffepedia/business_logic/forgot_password/forgot_password_cubit.dart';
import 'package:coffepedia/data/repository/forgot_password_repository.dart';
import 'package:coffepedia/data/web_services/forgot_password_web_services.dart';
import 'package:coffepedia/ui/screens/intro/OTP_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../main.dart';
import '../../custom_input.dart';

class ForgetPasswordScreenProvider extends StatelessWidget {
  const ForgetPasswordScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(
        ForgotPasswordRepository(
          ForgotPasswordWebServices(),
        ),
      ),
      child: ForgetPasswordScreen(),
    );
  }
}

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController _mobile = TextEditingController();
  @override
  void dispose() {
    _mobile.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 68.h,
              ),
              IconButton(
                padding: EdgeInsets.all(24.w),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 15.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 132.h,
                        bottom: 8.h,
                      ),
                      child: Text(
                        translator.translate(
                            "forget_password_screen.forget_password"),
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    Text(
                      translator
                          .translate("forget_password_screen.enter_mobile_msg"),
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: Color(0xff231F20),
                          ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 32.h,
                        bottom: 18.h,
                      ),
                      child: CustomInput(
                        title: translator
                            .translate("forget_password_screen.mobile"),
                        hint: translator
                            .translate("forget_password_screen.mobile"),
                        textEditingController: _mobile,
                        onChanged: (value) {},
                        max: true,
                        icon: false,
                        padding: false,
                        textInputType: TextInputType.number,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 16.h, bottom: 32.h),
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: _mobile.text.length < 11
                            ? () {}
                            : () {
                                BlocProvider.of<ForgotPasswordCubit>(context)
                                    .postForgotMobile(_mobile.text);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OTPScreenProvider(
                                      mobile: _mobile.text,
                                      isForgotPassword: true,
                                    ),
                                  ),
                                );
                              },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                          ),
                        ),
                        child: Text(
                          translator.translate("forget_password_screen.send"),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
