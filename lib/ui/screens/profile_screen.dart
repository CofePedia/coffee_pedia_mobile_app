import 'package:coffepedia/business_logic/auth/auth_bloc.dart';
import 'package:coffepedia/ui/screens/account_settings_screen.dart';
import 'package:coffepedia/ui/screens/address_book.dart';
import 'package:coffepedia/ui/screens/intro/login_register_screen.dart';
import 'package:coffepedia/ui/screens/my_wallet_screen.dart';
import 'package:coffepedia/ui/screens/switch_language_bottom_sheet.dart';
import 'package:coffepedia/ui/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'orders_history_screen.dart';
import 'profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
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
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
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
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
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
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return OrdersHistoryScreen();
                              },
                            ),
                          );
                        },
                      ),
                      ProfileItem(
                        title: "My wishlist",
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const WishlistScreen();
                              },
                            ),
                          );
                        },
                      ),
                      ProfileItem(
                        title: "Address Book",
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const AddressBookScreen();
                              },
                            ),
                          );
                        },
                      ),
                      ProfileItem(
                        title: "My Wallet",
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const MyWalletScreen();
                              },
                            ),
                          );
                        },
                      ),
                      ProfileItem(
                        title: "Account settings",
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AccountSettingsScreen();
                              },
                            ),
                          );
                        },
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        enableDrag: false,
                        isDismissible: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(22.r),
                            topRight: Radius.circular(22.r),
                          ),
                        ),
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => SwitchLanguageBottomSheet(),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        'Switch Language',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: Color(0xff231F20),
                            ),
                      ),
                      trailing: Text(
                        'English',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 103.h,
                ),
                InkWell(
                  onTap: () {
                    BlocProvider.of<AuthBloc>(context).add(LoggedOut());
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) {
                      return LoginPage();
                    }), (route) => false);
                  },
                  child: Container(
                    height: 54.h,
                    width: 343.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.12),
                          blurRadius: 11.r,
                          offset: Offset(0, 2),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Text(
                      'Logout',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontSize: 14.sp,
                            color: Color(0xffE23333),
                          ),
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
