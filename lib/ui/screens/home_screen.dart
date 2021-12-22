import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/business_logic/home_ads/home_ads_cubit.dart';
import 'package:coffepedia/data/repository/home_ads_repository.dart';
import 'package:coffepedia/data/web_services/home_ads_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/home/ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home/ad_banner.dart';
import 'home/ad_slider.dart';
import 'home/brands_icons.dart';
import 'home/card_category.dart';
import 'home/card_featured_products.dart';
import 'home/card_recent_products.dart';
import 'home/search_bar.dart';
import 'home/section_name.dart';

class HomeScreenProvider extends StatelessWidget {
  const HomeScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeAdsCubit(
            HomeAdsRepository(
              HomeAdsWebServices(),
            ),
          ),
        ),
      ],
      child: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeAdsCubit>(context).getHomeAds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeAdsCubit, HomeAdsState>(
        builder: (context, state) {
          if (state is HomeAdsLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 69.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 15.w,
                        right: 15.w,
                        bottom: 9.h,
                        top: 53.h,
                      ),
                      height: 105.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffFFD008),
                            Color(0xffFFE77E),
                          ],
                        ),
                      ),
                      child: SearchBar(
                        width: 345.w,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 24.h),
                      width: MediaQuery.of(context).size.width,
                      height: 170.h,
                      child: ListView.builder(
                        itemCount: state.homeAds!.data!.besideSlider!.length,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 8.w, right: 8.w),
                        itemBuilder: (context, index) {
                          return AdSlider(
                            adImage: state
                                .homeAds!.data!.besideSlider![index].image!,
                            onPress: onTap,
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 100.h,
                      child: ListView.builder(
                        itemCount: state.homeAds!.data!.topHeader!.length,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) => AdBanner(
                          adImageBackground:
                              state.homeAds!.data!.topHeader![index].image,
                          onPress: onTap,
                        ),
                      ),
                    ),
                    SecationName(sectionName: "Shop By Category"),
                    Container(
                      margin: EdgeInsets.only(bottom: 24.h),
                      width: MediaQuery.of(context).size.width,
                      height: 80.h,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        itemBuilder: (context, index) {
                          return CardCategory(
                            categoryImage:
                                "https://www.philips.sa/c-dam/b2c/category-pages/Household/coffee/master/philips-superautomatic/mea-2017/HD8651.png",
                            categoryImageBackground:
                                "https://www.pngmagic.com/product_images/beautiful-blue-color-background.png",
                            categoryName: "coffee",
                          );
                        },
                      ),
                    ),
                    SecationName(sectionName: "Featured Products"),
                    Container(
                      margin: EdgeInsets.only(bottom: 24.h),
                      width: MediaQuery.of(context).size.width,
                      height: 286.h,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 11.w),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: CardFeaturedProducts(
                              productImage:
                                  "https://www.philips.sa/c-dam/b2c/category-pages/Household/coffee/master/philips-superautomatic/mea-2017/HD8651.png",
                              productText:
                                  "Wonderful Pistachios, Sweet Chili Flavor, 14 Ounc",
                              rate: "4.5",
                              percentage: '25',
                              priceAfterDiscount: '340',
                              priceBeforeDiscount: '450',
                            ),
                          );
                        },
                      ),
                    ),
                    SecationName(sectionName: "Shop By Brands"),
                    Container(
                      margin: EdgeInsets.only(bottom: 24.h),
                      width: MediaQuery.of(context).size.width,
                      height: 90.h,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return BrandsIcons(
                              brandIcon:
                                  "https://waffarha.com/images/uploads/Cinnabon-Logo-logo-1630228283.png");
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 24.h),
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: state.homeAds!.data!.inPage!.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.only(left: 8.w, right: 8.w),
                        itemBuilder: (context, index) {
                          return Ads(
                            adImageBackground:
                                state.homeAds!.data!.inPage![index].image,
                          );
                        },
                      ),
                    ),
                    SecationName(sectionName: "Most Recent Products"),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200.h,
                      child: ListView.builder(
                        itemCount: 5,
                        padding: EdgeInsets.symmetric(horizontal: 11.w),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: CardRecentProducts(
                                productImage: Assets.imagesJar,
                                productText:
                                    "Wonderful Pistachios, Sweet Chili Flavor, 14 Ounc"),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  onTap() {
    BotToast.showText(text: "ad slider");
  }
}
