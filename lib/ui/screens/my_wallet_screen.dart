import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chechbox_widget.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
        screen: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 23.w, top: 60.h, right: 23.w, bottom: 35.5.h),
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
                      'My Wallet',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 74.h,
                width: 343.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.sp),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.12),
                        blurRadius: 11.r,
                        offset: Offset(1, 2)),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.payment),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                'Your balance',
                                style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'EGP199',
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                      Text(
                        ' Last update 09 Oct 2021',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
                child: CheckboxWidget(
                  title: 'Use my wallet balance when making order',
                ),
              ),
            ],
          ),
        ));
  }
}
