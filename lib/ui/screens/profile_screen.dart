import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 184.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffFFD008),
                        Color(0xffFFE77E),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.r),
                      bottomLeft: Radius.circular(30.r),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 60.h, bottom: 16.h),
                        child: Text(
                          "My Profile",
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Colors.black,
                              ),
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            maxRadius: 25.w,
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.grey,
                              size: 26.w,
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome back",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Text(
                                "Hesham Mahdy",
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      ProfileItem(
                        title: "Orders History",
                        onPress: () {},
                      ),
                      ProfileItem(
                        title: "My wishlist",
                        onPress: () {},
                      ),
                      ProfileItem(
                        title: "Address Book",
                        onPress: () {},
                      ),
                      ProfileItem(
                        title: "My Wallet",
                        onPress: () {},
                      ),
                      ProfileItem(
                        title: "Account settings",
                        onPress: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 5.h,
                  color: Color(0xffEFEFEF),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 17.h),
                  child: Column(
                    children: [
                      ProfileItem(
                        title: "Switch Language",
                        onPress: () {},
                      ),
                      ProfileItem(
                        title: "About Coffepedia",
                        onPress: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.w),
                    color: Colors.white,
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: Text(
                      "Logout",
                      style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 14.sp, color: Colors.red),
                    ),
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
