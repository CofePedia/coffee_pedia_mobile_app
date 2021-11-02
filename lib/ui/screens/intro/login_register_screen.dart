import 'package:circle_checkbox/redev_checkbox.dart';
import 'package:coffepedia/generated/assets.dart';
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
  bool selected = false;
  bool isLogin = true;
  @override
  void dispose() {
    _email.dispose();
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
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.close,
                      color: Color(0xff241F20),
                      size: 15.8.w,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    Assets.iconsCoffePediaLogo,
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
                        label: Text("With Facebook"),
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
                        label: Text("With Google"),
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
                        children: [
                          SizedBox(
                            width: 157.w,
                            child: CustomInput(
                              title: 'First Name',
                              hint: "First Name",
                              textEditingController: _email,
                            ),
                          ),
                          SizedBox(
                            width: 157.w,
                            child: CustomInput(
                              title: 'Last Name',
                              hint: "Last Name",
                              textEditingController: _email,
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
                  textEditingController: _email,
                ),
                isLogin
                    ? SizedBox.shrink()
                    : CustomInput(
                        title: 'Confirm Password',
                        hint: "Confirm password",
                        textEditingController: _email,
                      ),
                isLogin
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: Text("Forgot Password?"),
                      )
                    : SizedBox.shrink(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: isLogin ? 24.h : 16.h, bottom: 32.h),
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                      ),
                    ),
                    child: Text(isLogin ? "Login" : "Create Account"),
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
                              style: TextStyle(color: Colors.black, fontSize: 12),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'By creating account, you accept our ',
                                ),
                                TextSpan(text: 'terms and conditions '),
                                TextSpan(text: 'and '),
                                TextSpan(
                                  text: 'privacy policy',
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
                          activeColor: Color(0xff27DC4E),
                        ),
                      ),
                Padding(
                  padding: EdgeInsets.only(top: 32.h, bottom: 6.h),
                  child: Text(isLogin ? "Don’t have an Account" : "Have an Account"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    isLogin ? "Create account" : "Login",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: const Color(0xffe02020),
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
