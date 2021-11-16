import 'package:circle_checkbox/redev_checkbox.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/home_page.dart';
import 'package:coffepedia/ui/screens/intro/forget_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                      // Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Color(0xff241F20),
                      size: 15.8.w,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(
                    Assets.iconsLogoHor,
                    height: 51.h,
                    width: 196.w,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 50.h, bottom: 32.h),
                    child: Text(
                      isLogin ? "Login" : "Create Account",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black),
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
                          style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
                        ),
                        style: ButtonStyle(
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
                          style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
                        ),
                        style: ButtonStyle(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Divider(
                        height: 109.h,
                        color: Color(0xff929DAD),
                        thickness: 0.5.h,
                      ),
                    ),
                    Container(
                      width: 89.w,
                      child: Text(
                        isLogin ? "Or login with" : "Or",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        height: 109.h,
                        color: Color(0xff929DAD),
                        thickness: 0.5.h,
                      ),
                    ),
                  ],
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
                            ),
                          ),
                          SizedBox(
                            width: 157.w,
                            child: CustomInput(
                              title: 'Last Name',
                              hint: "Last Name",
                              textEditingController: _lastName,
                            ),
                          )
                        ],
                      ),
                CustomInput(
                  title: 'Email',
                  hint: "Email Address",
                  textEditingController: _email,
                ),
                CustomInput(
                  title: 'Password',
                  hint: "Enter password",
                  textEditingController: _password,
                ),
                isLogin
                    ? SizedBox.shrink()
                    : CustomInput(
                        title: 'Confirm Password',
                        hint: "Confirm password",
                        textEditingController: _confirmPassword,
                      ),
                isLogin
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return ForgetPasswordScreen();
                            }));
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.zero,
                            ),
                          ),
                          child: Text(
                            "Forgot Password?",
                            style: Theme.of(context).textTheme.headline2!.copyWith(
                                  color: Colors.red,
                                ),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: isLogin ? 10.h : 16.h, bottom: 32.h),
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const HomePage();
                          },
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
                      isLogin ? "Login" : "Create Account",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ),
                isLogin
                    ? SizedBox.shrink()
                    : Directionality(
                        textDirection: TextDirection.rtl,
                        child: CircleCheckboxListTile(
                          title: RichText(
                            textAlign: TextAlign.end,
                            text: TextSpan(
                              style: Theme.of(context).textTheme.headline2!.copyWith(
                                    color: Color(0xff231F20),
                                  ),
                              children: <TextSpan>[
                                TextSpan(text: 'By creating account, you accept our '),
                                TextSpan(
                                    text: 'terms and conditions ',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    )),
                                TextSpan(text: 'and '),
                                TextSpan(
                                    text: 'privacy policy',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ))
                              ],
                            ),
                          ),
                          value: selected,
                          onChanged: (value) => setState(() {
                            selected = value!;
                          }),
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          activeColor: Color(0xff27DC4E),
                        ),
                      ),
                Padding(
                  padding: EdgeInsets.only(top: 32.h, bottom: 6.h),
                  child: Text(
                    isLogin ? "Don’t have an Account" : "Have an Account",
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Color(0xff231F20),
                        ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text(
                    isLogin ? "Create account" : "Login",
                    style: Theme.of(context).textTheme.headline2!.copyWith(
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
      ),
    );
  }
}
