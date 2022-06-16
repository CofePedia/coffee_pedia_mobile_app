import 'package:badges/badges.dart';
import 'package:coffepedia/business_logic/basket/basket_cubit.dart';
import 'package:coffepedia/data/repository/basket_repository.dart';
import 'package:coffepedia/data/web_services/basket_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/services/preferences.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../main.dart';
import '../checkout_items_screen.dart';
import 'home_screen.dart';
import 'more_screen.dart';
import 'profile_screen.dart';

class HomePageProvider extends StatelessWidget {
  final int currentIndex;
  const HomePageProvider({required this.currentIndex, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BasketCubit(
        BasketRepository(BasketWebServices()),
      ),
      child: HomePage(
        currentIndex: currentIndex,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);
  final int currentIndex;

  @override
  _HomePageState createState() => _HomePageState(this.currentIndex);
}

class _HomePageState extends State<HomePage> {
  late int currentIndex;

  _HomePageState(this.currentIndex);

  BottomNavigationBarItem getItem(String image, String title, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        width: 24.w,
        padding: EdgeInsets.only(bottom: 5.h),
        child: Badge(
          badgeColor: kYellow,
          showBadge: Prefs.getString("totalItems") != null &&
                  Prefs.getString("totalItems") != "0" &&
                  index == 1
              ? true
              : false,
          badgeContent: BlocBuilder<BasketCubit, BasketState>(
            builder: (context, state) {
              if (state is LocalBasketLoaded) {
                return Text(
                  Prefs.getString("totalItems") ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: kGrey5),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
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

  Map<int, GlobalKey> navigatorKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
    2: GlobalKey(),
    3: GlobalKey(),
  };
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BasketCubit>(context).getAllLocalProductsFromBasket();

    return CheckInternetConnection(
      screen: Scaffold(
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
                getItem(Assets.iconsHome,
                    translator.translate("home_screen.home_tap"), 0),
                getItem(Assets.iconsShoppingBasket,
                    translator.translate("home_screen.my_basket_tap"), 1),
                getItem(Assets.iconsProfile,
                    translator.translate("home_screen.profile_tap"), 2),
                getItem(Assets.iconsMore,
                    translator.translate("home_screen.more_tap"), 3),
              ],
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Color(0xff4470C1),
              selectedLabelStyle:
                  Theme.of(context).textTheme.bodyText2!.copyWith(
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
        body: WillPopScope(
          onWillPop: () async {
            if (currentIndex == 1 || currentIndex == 2 || currentIndex == 3) {
              return !await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePageProvider(currentIndex: 0)),
                ModalRoute.withName('/'),
              );
            } else {
              return true;
            }
          },
          child: IndexedStack(
            index: currentIndex,
            children: [
              HomeScreenProvider(),
              CheckoutItemsScreenProvider(
                onAddPressed: () {
                  setState(() {});
                },
              ),
              ProfileScreen(),
              MoreScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
