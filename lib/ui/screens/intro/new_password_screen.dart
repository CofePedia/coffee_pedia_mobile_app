import 'package:coffepedia/business_logic/forgot_password/forgot_password_cubit.dart';
import 'package:coffepedia/data/repository/forgot_password_repository.dart';
import 'package:coffepedia/data/web_services/forgot_password_web_services.dart';
import 'package:coffepedia/main.dart';
import 'package:coffepedia/ui/screens/intro/login_register_screen.dart';
import 'package:coffepedia/ui/shared/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPasswordScreenProvider extends StatelessWidget {
  final String mobile;
  final String otp;
  const NewPasswordScreenProvider({
    required this.otp,
    required this.mobile,
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
      child: NewPasswordScreen(
        mobile: mobile,
        otp: otp,
      ),
    );
  }
}

class NewPasswordScreen extends StatefulWidget {
  final String mobile;
  final String otp;
  NewPasswordScreen({required this.otp, required this.mobile, Key? key})
      : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _password = TextEditingController();

  final TextEditingController _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _password.dispose();
    _confirmPassword.dispose();
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
                        translator
                            .translate("new_password_screen.new_password"),
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    Text(
                      translator.translate(
                          "new_password_screen.please_enter_the_new_password"),
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
                              .translate("new_password_screen.new_password"),
                          hint: translator
                              .translate("new_password_screen.new_password"),
                          textEditingController: _password,
                          textInputType: TextInputType.visiblePassword,
                          icon: true,
                          padding: false,
                          onChanged: (value) {}),
                    ),
                    CustomInput(
                        title: translator.translate(
                            "new_password_screen.confirm_new_password"),
                        hint: translator.translate(
                            "new_password_screen.confirm_new_password"),
                        textEditingController: _confirmPassword,
                        textInputType: TextInputType.visiblePassword,
                        padding: false,
                        icon: true,
                        onChanged: (value) {}),
                    BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
                      listener: (context, state) {
                        if (state is UpdatePasswordIsPressed) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginPage();
                              },
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 16.h, bottom: 32.h),
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<ForgotPasswordCubit>(context)
                                .postUpdatePassword(
                              widget.mobile,
                              widget.otp,
                              _password.text,
                              _confirmPassword.text,
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
                            translator.translate("new_password_screen.confirm"),
                            style: Theme.of(context).textTheme.headline2,
                          ),
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
