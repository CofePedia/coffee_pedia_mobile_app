import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../custom_input.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                      "Forgot Password",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black),
                    ),
                  ),
                  Text(
                    "Please enter your email address",
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
                      title: "Email",
                      hint: "Email Address",
                      textEditingController: _email,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 16.h, bottom: 32.h),
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
                      child: Text(
                        "Send",
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
    );
  }
}
