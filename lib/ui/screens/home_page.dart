import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../checkout_items_screen.dart';
import 'basket_screen.dart';
import 'profile_screen.dart';
import 'home_screen.dart';
import 'more_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  BottomNavigationBarItem getItem(String image, String title, int index) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 7.h),
        child: Image.asset(
          image,
          width: 24.w,
          height: 24.h,
          color: currentIndex == index ? Color(0xff4470C1) : const Color(0xff606c74),
        ),
      ),
      label: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
        selectedLabelStyle: TextStyle(fontSize: 12.sp, color: Color(0xff4470C1)),
        unselectedLabelStyle: TextStyle(fontSize: 12.sp, color: Color(0xff606C74)),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          const HomeScreen(),
          const CheckoutItemsScreen(),
          const ProfileScreen(),
          const MoreScreen(),
        ],
      ),
    );
  }
}
