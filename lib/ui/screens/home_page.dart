import 'package:badges/badges.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../checkout_items_screen.dart';
import 'home_screen.dart';
import 'more_screen.dart';
import 'profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  BottomNavigationBarItem getItem(String image, String title, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        width: 24.w,
        padding: EdgeInsets.only(bottom: 7.h),
        child: Badge(
          badgeColor: kYellow,
          showBadge: index == 1 ? true : false,
          // font change
          badgeContent: Text(
            '2',
            style:
                Theme.of(context).textTheme.headline5!.copyWith(color: kGrey5),
          ),
          child: SvgPicture.asset(
            image,
            width: 24.w,
            height: 24.h,
            color: currentIndex == index
                ? Color(0xff4470C1)
                : const Color(0xff606c74),
          ),
        ),
      ),
      label: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 69.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.r),
            topRight: Radius.circular(22.r),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.0),
            topRight: Radius.circular(22.0),
          ),
          child: BottomNavigationBar(
            items: [
              getItem(Assets.iconsHome, "Shop", 0),
              getItem(Assets.iconsShoppingBasket, "My Basket", 1),
              getItem(Assets.iconsProfile, "Profile", 2),
              getItem(Assets.iconsMore, "More", 3),
            ],
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xff4470C1),
            selectedLabelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Color(0xff4470C1),
                  fontWeight: FontWeight.w900,
                ),
            unselectedLabelStyle:
                Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Color(0xff606C74),
                      fontWeight: FontWeight.w900,
                    ),
          ),
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
           HomeScreenProvider(),
           CheckoutItemsScreenProvider(),
           ProfileScreen(),
           MoreScreen(),
        ],
      ),
    );
  }
}
