import 'package:coffepedia/business_logic/home_ads/home_ads_cubit.dart';
import 'package:coffepedia/data/repository/home_ads_repository.dart';
import 'package:coffepedia/data/web_services/home_ads_web_services.dart';
import 'package:coffepedia/main.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/screens/home/brands_icons.dart';
import 'package:coffepedia/ui/screens/home/card_category.dart';
import 'package:coffepedia/ui/screens/home/card_featured_products.dart';
import 'package:coffepedia/ui/screens/home/card_recent_products.dart';
import 'package:coffepedia/ui/screens/home/section_name.dart';
import 'package:coffepedia/ui/shared/custom_network_image.dart';
import 'package:coffepedia/ui/widgets/home_slider_widget.dart';
import 'package:coffepedia/ui/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pushwoosh_flutter/pushwoosh_flutter.dart';

import '../../generated/assets.dart';
import 'home/search_widget.dart';

class HomeScreenProvider extends StatelessWidget {
  final Function onAddTapped;
  final ScrollController controller;
  const HomeScreenProvider(
      {required this.onAddTapped, required this.controller, Key? key})
      : super(key: key);
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
      child: HomeScreen(controller: controller, onAddTapped: onAddTapped),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final Function onAddTapped;

  final ScrollController controller;

  const HomeScreen(
      {required this.onAddTapped, required this.controller, Key? key})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeAdsCubit>(context).getHomeAds();
    Pushwoosh.getInstance.onPushReceived.listen((event) {});
    Pushwoosh.getInstance.onPushAccepted.listen((event) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
        screen: Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // search bar
          Container(
            padding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
              bottom: 9.h,
              top: 53.h,
            ),
            height: 160.h,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  Assets.iconsHomeLogo,
                  height: 50.h,
                  width: 151.w,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: SearchWidget(
                    width: 345.w,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              padding: EdgeInsets.zero,
              controller: widget.controller,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                //home ads
                HomeSlidersProvider(),
                BlocBuilder<HomeAdsCubit, HomeAdsState>(
                  builder: (context, state) {
                    if (state is HomeAdsLoaded) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60.h,
                        child: ListView.builder(
                          itemCount: state.homeAds!.data!.topHeader!.length,
                          // itemCount: 1,

                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: CustomNetworkImage(
                              imageUrl:
                                  state.homeAds!.data!.topHeader![index].image!,
                              height: 60.h,
                              width: 250.w,
                              radius: 0.r,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return SecondSliderShimmerWidget();
                    }
                  },
                ),
                SizedBox(
                  height: 19.h,
                ),
                SectionName(
                    sectionName:
                        translator.translate("home_screen.shop_by_category")),
                Categories(),
                SectionName(
                    sectionName:
                        translator.translate("home_screen.featured_products")),
                FeaturedProducts(onAddTapped: widget.onAddTapped),

                BlocBuilder<HomeAdsCubit, HomeAdsState>(
                  builder: (context, state) {
                    if (state is HomeAdsLoaded) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 24.h),
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: state.homeAds!.data!.inPage!.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.only(left: 8.w, right: 8.w),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5.h, horizontal: 5.w),
                              child: CustomNetworkImage(
                                imageUrl:
                                    state.homeAds!.data!.inPage![index].image!,
                                height: 210.h,
                                width: 344.w,
                                radius: 0.r,
                              ),
                            );
                            // return Ads(
                            //   adImageBackground: state
                            //       .homeAds!.data!.inPage![index].image,
                            // );
                          },
                        ),
                      );
                    } else {
                      return AdsShimmerWidget();
                    }
                  },
                ),
                SectionName(
                    sectionName:
                        translator.translate("home_screen.shop_by_brands")),
                BrandsProvider(),

                SectionName(
                    sectionName:
                        translator.translate("home_screen.recent_products")),
                MostRecent(onAddTapped: widget.onAddTapped),
                SizedBox(
                  height: 230.h,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
