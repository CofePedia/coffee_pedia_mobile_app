import 'package:coffepedia/business_logic/me/me_cubit.dart';
import 'package:coffepedia/constants/colors.dart';
import 'package:coffepedia/data/repository/me_repository.dart';
import 'package:coffepedia/data/web_services/me_web_services.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/account_settings_screen.dart';
import 'package:coffepedia/ui/screens/address_bookٍ_screen.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/screens/intro/login_register_screen.dart';
import 'package:coffepedia/ui/screens/switch_language_bottom_sheet.dart';
import 'package:coffepedia/ui/screens/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../main.dart';
import 'orders_history_screen.dart';
import 'profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MeCubit(
        MeRepository(
          MeWebServices(),
        ),
      ),
      child: _ProfileScreen(),
    );
  }
}

class _ProfileScreen extends StatefulWidget {
  const _ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<_ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<_ProfileScreen> {
  @override
  void initState() {
    // BlocProvider.of<MeCubit>(context).getMe();
    super.initState();
  }

  final userDao = UserDao();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MeCubit>(context).getMe();
    return CheckInternetConnection(
      screen: BlocBuilder<MeCubit, MeState>(
        builder: (context, state) {
          if (state is MeIsLoaded) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // top profile container
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 184.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              kYellow,
                              kBabyYellow,
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
                                translator
                                    .translate("profile_screen.my_profile"),
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                            ),
                            // images
                            Row(
                              children: [
                                state.me!.data!.avatar != ''
                                    ? Container(
                                        width: 55.0.w,
                                        height: 55.0.h,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              state.me!.data!.avatar!,
                                            ),
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      )
                                    : CircleAvatar(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        radius: 25.r,
                                        child: SvgPicture.asset(
                                          Assets.userPhote,
                                        ),
                                      ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                // Hello .. User Name
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      translator.translate(
                                          "profile_screen.welcome_back"),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontSize: 12.sp,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(state.me!.data!.name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption),
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
                      // menu container
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            //ordersHistory
                            ProfileItem(
                              title: translator
                                  .translate("profile_screen.order_history"),
                              onPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return OrdersHistoryProvider();
                                    },
                                  ),
                                );
                              },
                            ),
                            //my wishlist
                            ProfileItem(
                              title: translator
                                  .translate("profile_screen.my_wishlist"),
                              onPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const WishlistScreenProvider();
                                    },
                                  ),
                                );
                              },
                            ),
                            //address book
                            ProfileItem(
                              title: translator
                                  .translate("profile_screen.address_book"),
                              onPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return AddressBookScreenProvider();
                                    },
                                  ),
                                );
                              },
                            ),
                            // ProfileItem(
                            //   title: "My Wallet",
                            //   onPress: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) {
                            //           return const MyWalletScreen();
                            //         },
                            //       ),
                            //     );
                            //   },
                            // ),
                            //account settings
                            ProfileItem(
                              title: translator
                                  .translate("profile_screen.account_settings"),
                              onPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return AccountSettingsScreen(
                                        me: state.me!,
                                      );
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
                      // language..
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 6.h),
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
                              translator
                                  .translate("profile_screen.switch_language"),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    color: Color(0xff231F20),
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 16.w,
                            ),
                            // trailing: Text(
                            //   translator.translate("profile_screen.english"),
                            //   style: Theme.of(context).textTheme.headline6,
                            // ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 130.h,
                      // ),
                      // logout
                      InkWell(
                        onTap: () {
                          // BlocProvider.of<AuthBloc>(context).add(
                          //   LoggedOut(),
                          // );
                          BlocProvider.of<MeCubit>(context).logout();
                          userDao.deleteUser();
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) {
                              return LoginPage();
                            }),
                          );
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
                            translator.translate("profile_screen.logout"),
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      fontSize: 14.sp,
                                      color: Color(0xffE23333),
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is MeIsNotExist) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // top profile container
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 184.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              kYellow,
                              kBabyYellow,
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
                                translator
                                    .translate("profile_screen.my_profile"),
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                            ),
                            // images
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  radius: 25.r,
                                  child: SvgPicture.asset(
                                    Assets.userPhote,
                                  ),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                // Hello .. User Name
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      translator
                                          .translate("profile_screen.welcome"),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontSize: 12.sp,
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
                      // menu container
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                      //   child: Column(
                      //     children: [
                      //       //my wishlist
                      //       ProfileItem(
                      //         title: translator
                      //             .translate("profile_screen.my_wishlist"),
                      //         onPress: () {
                      //           Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //               builder: (context) {
                      //                 return const WishlistScreenProvider();
                      //               },
                      //             ),
                      //           );
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   height: 5.h,
                      //   color: Color(0xffEFEFEF),
                      // ),
                      // language..
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 6.h),
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
                              translator
                                  .translate("profile_screen.switch_language"),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    color: Color(0xff231F20),
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 16.w,
                            ),
                            // trailing: Text(
                            //   translator.translate("profile_screen.english"),
                            //   style: Theme.of(context).textTheme.headline6,
                            // ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      // login
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return LoginPage();
                          }));
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
                            translator.translate("profile_screen.login"),
                            style:
                                Theme.of(context).textTheme.headline2!.copyWith(
                                      fontSize: 14.sp,
                                      color: kBlue,
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            print('amrazzam');

            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
/*screen: BlocBuilder<MeCubit, MeState>(
        builder: (context, state) {
          if (state is MeIsLoaded) {
            return Scaffold(
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
                              kYellow,
                              kBabyYellow,
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
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                            ),
                            Row(
                              children: [
                                state.me!.data!.avatar != ''
                                    ? Container(
                                        width: 55.0.w,
                                        height: 55.0.h,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              state.me!.data!.avatar!,
                                            ),
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      )
                                    : CircleAvatar(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        radius: 25.r,
                                        child: SvgPicture.asset(
                                          Assets.userPhote,
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontSize: 12.sp,
                                          ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(state.me!.data!.name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption),
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
                                      return OrdersHistoryProvider();
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
                                      return const WishlistScreenProvider();
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
                                      return AddressBookScreenProvider();
                                    },
                                  ),
                                );
                              },
                            ),
                            // ProfileItem(
                            //   title: "My Wallet",
                            //   onPress: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) {
                            //           return const MyWalletScreen();
                            //         },
                            //       ),
                            //     );
                            //   },
                            // ),
                            ProfileItem(
                              title: "Account settings",
                              onPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return AccountSettingsScreen(
                                        me: state.me!,
                                      );
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 6.h),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
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
                          // BlocProvider.of<AuthBloc>(context).add(
                          //   LoggedOut(),
                          // );
                          BlocProvider.of<MeCubit>(context).logout();
                          userDao.deleteUser();
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
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      fontSize: 14.sp,
                                      color: Color(0xffE23333),
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),*/
