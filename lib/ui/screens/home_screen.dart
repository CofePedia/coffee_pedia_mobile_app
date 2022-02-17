import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/business_logic/home_ads/home_ads_cubit.dart';
import 'package:coffepedia/data/repository/home_ads_repository.dart';
import 'package:coffepedia/data/web_services/home_ads_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/screens/home/ads.dart';
import 'package:coffepedia/ui/screens/home/brands_icons.dart';
import 'package:coffepedia/ui/screens/home/card_recent_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home/ad_banner.dart';
import 'home/ad_slider.dart';
import 'home/card_category.dart';
import 'home/card_featured_products.dart';
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
    return CheckInternetConnection(screen: Scaffold(
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
                      height: 150.h,
                      width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).primaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            Assets.iconsHomeLogo,
                            height: 40.h,
                            width: 151.w,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Expanded(
                            child: SearchBar(
                              width: 345.w,
                            ),
                          ),
                        ],
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
                    SectionName(sectionName: "Shop By Category"),
                    Categories(),
                    SectionName(sectionName: "Featured Products"),
                    FeaturedProducts(),
                    SectionName(sectionName: "Shop By Brands"),
                    BrandsProvider(),
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
                    SectionName(sectionName: "Most Recent Products"),
                    MostRecent(),
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
    ));
  }

  onTap() {
    BotToast.showText(text: "ad slider");
  }
}
