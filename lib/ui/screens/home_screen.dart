import 'package:card_swiper/card_swiper.dart';
import 'package:coffepedia/business_logic/home_ads/home_ads_cubit.dart';
import 'package:coffepedia/data/repository/home_ads_repository.dart';
import 'package:coffepedia/data/web_services/home_ads_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/main.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/screens/home/brands_icons.dart';
import 'package:coffepedia/ui/screens/home/card_category.dart';
import 'package:coffepedia/ui/screens/home/card_featured_products.dart';
import 'package:coffepedia/ui/screens/home/card_recent_products.dart';
import 'package:coffepedia/ui/screens/home/search_widget.dart';
import 'package:coffepedia/ui/screens/home/section_name.dart';
import 'package:coffepedia/ui/shared/custom_network_image.dart';
import 'package:coffepedia/ui/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pushwoosh/pushwoosh.dart';

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
  InAppWebViewController? webView;
  Uri url = Uri.parse(
    "",
  );
  double progress = 0;
  @override
  void initState() {
    BlocProvider.of<HomeAdsCubit>(context).getHomeAds();
    Pushwoosh.getInstance.onPushReceived.listen((event) {
      print("onPushReceived ${event.toString()}");
    });
    Pushwoosh.getInstance.onPushAccepted.listen((event) {
      print("onPushAccepted ${event.toString()}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
        screen: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 69.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //search bar
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
              SizedBox(
                height: 16.h,
              ),
              //home ads

              BlocBuilder<HomeAdsCubit, HomeAdsState>(
                builder: (context, state) {
                  if (state is HomeAdsLoaded) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          width: MediaQuery.of(context).size.width,
                          // color: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          height: 220.h,
                          child: Swiper(
                            outer: true,
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                state.homeAds!.data!.besideSlider!.length,
                            autoplay: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => InAppWebView(
                                              initialUrlRequest: URLRequest(
                                                url: Uri.parse(
                                                  state
                                                      .homeAds!
                                                      .data!
                                                      .besideSlider![index]
                                                      .url!,
                                                ),
                                              ),
                                              initialOptions:
                                                  InAppWebViewGroupOptions(
                                                crossPlatform:
                                                    InAppWebViewOptions(
                                                  useShouldOverrideUrlLoading:
                                                      true,
                                                  mediaPlaybackRequiresUserGesture:
                                                      false,
                                                ),
                                                android:
                                                    AndroidInAppWebViewOptions(
                                                  useHybridComposition: true,
                                                ),
                                                ios: IOSInAppWebViewOptions(
                                                  allowsInlineMediaPlayback:
                                                      true,
                                                ),
                                              ),
                                              onWebViewCreated:
                                                  (InAppWebViewController
                                                      controller) {
                                                webView = controller;
                                              },
                                              onLoadStart:
                                                  (InAppWebViewController
                                                          controller,
                                                      url) {
                                                setState(() {
                                                  this.url = url!;
                                                });
                                              },
                                              onLoadStop:
                                                  (InAppWebViewController
                                                          controller,
                                                      url) {
                                                setState(() {
                                                  this.url = url!;
                                                });
                                              },
                                              onProgressChanged:
                                                  (InAppWebViewController
                                                          controller,
                                                      int progress) {
                                                setState(() {
                                                  this.progress =
                                                      progress / 100;
                                                  print(
                                                      'onProgressChangeAmr $progress');
                                                });
                                              },
                                            )),
                                  );
                                },
                                child: CustomNetworkImage(
                                  imageUrl: state.homeAds!.data!
                                      .besideSlider![index].image!,
                                  height: 170.h,
                                  width: MediaQuery.of(context).size.width,
                                  radius: 7.r,
                                  fit: BoxFit.fill,
                                ),
                              );
                            },
                            pagination: SwiperPagination(
                              margin: EdgeInsets.only(top: 8.h),
                              builder: DotSwiperPaginationBuilder(
                                color: Colors.grey,
                                activeColor: Theme.of(context).primaryColor,
                                size: 8.h,
                                activeSize: 10.h,
                                space: 2.w,
                              ),
                            ),
                          ),
                          // child: ListView.builder(
                          //   itemCount:
                          //       state.homeAds!.data!.besideSlider!.length,
                          //   scrollDirection: Axis.horizontal,
                          //   padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          //   itemBuilder: (context, index) {
                          //     return Padding(
                          //       padding: EdgeInsets.symmetric(horizontal: 4.w),
                          //       child: CustomNetworkImage(
                          //           imageUrl: state.homeAds!.data!
                          //               .besideSlider![index].image!,
                          //           height: 170.h,
                          //           width: 350.w,
                          //           radius: 7.0.r),
                          //     );
                          //   },
                          // ),
                        ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 60.h,
                        //   child: ListView.builder(
                        //     //TODO change index
                        //     // itemCount: state.homeAds!.data!.topHeader!.length,
                        //     itemCount: 1,
                        //
                        //     scrollDirection: Axis.horizontal,
                        //     padding: EdgeInsets.zero,
                        //     itemBuilder: (context, index) => CustomNetworkImage(
                        //       //TODO change index
                        //       // imageUrl:
                        //       //     state.homeAds!.data!.topHeader![index].image!,
                        //       imageUrl:
                        //           state.homeAds!.data!.topHeader![3].image!,
                        //       height: 60.h,
                        //       width: MediaQuery.of(context).size.width,
                        //       radius: 0.r,
                        //       fit: BoxFit.fill,
                        //     ),
                        //   ),
                        // ),
                      ],
                    );
                  } else {
                    return SlidersShimmerWidget();
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
              FeaturedProducts(),
              SectionName(
                  sectionName:
                      translator.translate("home_screen.shop_by_brands")),
              BrandsProvider(),
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
                          //TODO make radius = 0
                          return CustomNetworkImage(
                            imageUrl:
                                state.homeAds!.data!.inPage![index].image!,
                            height: 270.h,
                            width: 344.w,
                            radius: 9.r,
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
                      translator.translate("home_screen.recent_products")),
              MostRecent(),
            ],
          ),
        ),
      ),
    ));
  }
}
