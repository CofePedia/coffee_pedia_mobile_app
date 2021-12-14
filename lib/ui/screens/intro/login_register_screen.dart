import 'package:circle_checkbox/redev_checkbox.dart';
import 'package:coffepedia/business_logic/login/login_bloc.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/home_page.dart';
import 'package:coffepedia/ui/screens/intro/forget_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors.dart';
import '../../custom_input.dart';

class LoginRegisterScreen extends StatefulWidget {
  const LoginRegisterScreen({Key? key}) : super(key: key);

  @override
  State<LoginRegisterScreen> createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  bool selected = false;
  bool isLogin = true;

  @override
  void dispose() {
    _email.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  _onLoginButtonPressed() {
    BlocProvider.of<LoginBloc>(context).add(
      LoginButtonPressed(
        email: _email.text,
        password: _password.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFaliure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ));
          } else if (state is LoginSuccess) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()));
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 68.39.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isLogin = !isLogin;
                            });
                          },
                          child: Icon(
                            Icons.close,
                            color: kGrey,
                            size: 15.8.w,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset(
                          Assets.iconsLogoHor,
                          height: 51.3.h,
                          width: 196.w,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 79.7.h, bottom: 32.h),
                          child: Text(
                            isLogin ? "Login" : "Create Account",
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: kBlack,
                                    ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 156.w,
                            height: 40.h,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                Assets.iconsFacebookSquare,
                                width: 19.3.w,
                                height: 19.3.h,
                              ),
                              label: Text(
                                "With Facebook",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(fontSize: 12.sp),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kDarkBlue),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 156.w,
                            height: 40.h,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                Assets.iconsGoogle,
                                width: 19.3.w,
                                height: 19.3.h,
                              ),
                              label: Text(
                                "With Google",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(fontSize: 12.sp),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kBlue),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 24.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Divider(
                                color: kLightGrey,
                                thickness: 0.5.h,
                              ),
                            ),
                            Container(
                              width: 89.w,
                              child: Text(
                                isLogin ? "Or login with" : "Or",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(color: kLightBlack),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: kLightGrey,
                                thickness: 0.5.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                      isLogin
                          ? SizedBox.shrink()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 157.w,
                                  child: CustomInput(
                                    title: 'First Name',
                                    hint: "First Name",
                                    textEditingController: _firstName,
                                    padding: false,
                                  ),
                                ),
                                SizedBox(
                                  width: 157.w,
                                  child: CustomInput(
                                    title: 'Last Name',
                                    hint: "Last Name",
                                    textEditingController: _lastName,
                                    padding: false,
                                  ),
                                )
                              ],
                            ),
                      CustomInput(
                        padding: false,
                        title: 'Email Address',
                        hint: "Email Address",
                        textEditingController: _email,
                      ),
                      CustomInput(
                        title: 'Password',
                        hint: "Enter password",
                        textEditingController: _password,
                        icon: true,
                        padding: false,
                      ),
                      isLogin
                          ? SizedBox.shrink()
                          : CustomInput(
                              title: 'Confirm Password',
                              hint: "Confirm password",
                              textEditingController: _confirmPassword,
                              padding: false,
                              icon: true,
                            ),
                      isLogin
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.h),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ForgetPasswordScreen();
                                        },
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(color: kRed),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                            top: isLogin ? 10.h : 16.h, bottom: 32.h),
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: state is! LoginLoading
                              ? _onLoginButtonPressed
                              : null,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                            ),
                          ),
                          child: Text(
                            isLogin ? "Login" : "Create Account",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      ),
                      isLogin
                          ? SizedBox(
                              height: 32.h,
                            )
                          : Directionality(
                              textDirection: TextDirection.rtl,
                              child: CircleCheckboxListTile(
                                title: RichText(
                                  textAlign: TextAlign.end,
                                  text: TextSpan(
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                          color: kLightBlack,
                                        ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              'By creating account, you accept our '),
                                      TextSpan(
                                        text: 'terms and conditions',
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      TextSpan(text: ' and '),
                                      TextSpan(
                                        text: 'privacy policy',
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          decoration: TextDecoration.underline,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                value: selected,
                                onChanged: (value) => setState(() {
                                  selected = value!;
                                }),
                                dense: true,
                                contentPadding: EdgeInsets.all(0),
                                activeColor: kGreen,
                              ),
                            ),
                      Padding(
                        padding: EdgeInsets.only(top: 32.h, bottom: 6.h),
                        child: Text(
                          isLogin ? "Don’t have an Account" : "Have an Account",
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    color: kLightBlack,
                                  ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: Text(
                          isLogin ? "Create account" : "Login",
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
