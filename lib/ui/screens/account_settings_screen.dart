import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 20.w, top: 60.h, right: 23.w, bottom: 35.5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.chevron_left,
                      size: 24.w,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'Account settings',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 18.sp,
                        ),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              backgroundColor: Color(0xffD8D8D8),
              radius: 30.r,
              child: SvgPicture.asset(
                Assets.userPhote,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              'Add photo',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: 12.sp),
            ),
            SizedBox(
              height: 10.5.h,
            ),
            Text(
              'Hesham Mahdy',
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 4.5.h,
            ),
            Text(
              'hmahmd220@gmail.com',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 24.h,
            ),
            Container(
              height: 214.h,
              //  width: 343.w,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.sp),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                    offset: Offset(0, 2),
                    blurRadius: 11.r,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 19.8.h, right: 15.w, left: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Personal info',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          'Edit',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontSize: 12.sp,
                                  ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 16.h, right: 15.w, left: 15.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'First Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    color: Color(
                                      0xff8A8A8A,
                                    ),
                                  ),
                            ),
                            Text(
                              'Hesham',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            SizedBox(height: 18.h),
                            Text(
                              'Email Address',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    color: Color(
                                      0xff8A8A8A,
                                    ),
                                  ),
                            ),
                            Text(
                              'hmahmd220@gmail.com',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            SizedBox(height: 18.h),
                            Text(
                              'Password',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    color: Color(
                                      0xff8A8A8A,
                                    ),
                                  ),
                            ),
                            Text(
                              '************',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Last Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    color: Color(
                                      0xff8A8A8A,
                                    ),
                                  ),
                            ),
                            Text(
                              'Mahdy',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              height: 144.h,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.sp),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                    offset: Offset(0, 2),
                    blurRadius: 11.r,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 19.8.h, right: 15.w, left: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping Address',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          'Manage Addresses',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontSize: 12.sp,
                                  ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hesham Mahdy',
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontSize: 14.sp,
                                  ),
                        ),
                        Container(
                          height: 17.h,
                          width: 67.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(
                              0xffFFD008,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                12.5.r,
                              ),
                              bottomRight: Radius.circular(
                                12.5.r,
                              ),
                              bottomLeft: Radius.circular(
                                12.5.r,
                              ),
                            ),
                          ),
                          child: Text(
                            'Primary',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 10.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Expanded(
                      child: Text(
                        'Walk Of Cairo 6 October City, Giza Governorate, Egypt 12588 - 6th of October City',
                        maxLines: 3,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              height: 92.h,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.sp),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                    offset: Offset(0, 2),
                    blurRadius: 11.r,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 19.8.h, right: 15.w, left: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment Method',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          'Add new card',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontSize: 12.sp,
                                  ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.imagesVisaLogo),
                        SizedBox(
                          width: 22.78.w,
                        ),
                        Text(
                          '**** **** **** 5089',
                          style: Theme.of(context).textTheme.headline5,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
