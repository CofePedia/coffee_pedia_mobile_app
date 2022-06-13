import 'package:card_swiper/card_swiper.dart';
import 'package:coffepedia/business_logic/home_ads/home_ads_cubit.dart';
import 'package:coffepedia/data/web_services/home_ads_web_services.dart';
import 'package:coffepedia/ui/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/repository/home_ads_repository.dart';
import '../shared/custom_network_image.dart';

class HomeSlidersProvider extends StatelessWidget {
  const HomeSlidersProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeAdsCubit(HomeAdsRepository(HomeAdsWebServices())),
      child: HomeSliders(),
    );
  }
}

class HomeSliders extends StatefulWidget {
  const HomeSliders({Key? key}) : super(key: key);

  @override
  _HomeSlidersState createState() => _HomeSlidersState();
}

class _HomeSlidersState extends State<HomeSliders> {
  InAppWebViewController? webView;
  Uri url = Uri.parse(
    "",
  );
  double progress = 0;
  @override
  void initState() {
    BlocProvider.of<HomeAdsCubit>(context).getHomeSliders();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeAdsCubit, HomeAdsState>(builder: (context, state) {
      if (state is HomeSlidersLoaded) {
        return Container(
          margin: EdgeInsets.only(bottom: 10.h),
          width: MediaQuery.of(context).size.width,
          // color: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          height: 220.h,
          child: Swiper(
            outer: true,
            scrollDirection: Axis.horizontal,
            itemCount: state.homeSliders!.data!.length,
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
                                  state.homeSliders!.data![index]!.url!,
                                ),
                              ),
                              initialOptions: InAppWebViewGroupOptions(
                                crossPlatform: InAppWebViewOptions(
                                  useShouldOverrideUrlLoading: true,
                                  mediaPlaybackRequiresUserGesture: false,
                                ),
                                android: AndroidInAppWebViewOptions(
                                  useHybridComposition: true,
                                ),
                                ios: IOSInAppWebViewOptions(
                                  allowsInlineMediaPlayback: true,
                                ),
                              ),
                              onWebViewCreated:
                                  (InAppWebViewController controller) {
                                webView = controller;
                              },
                              onLoadStart:
                                  (InAppWebViewController controller, url) {
                                setState(() {
                                  this.url = url!;
                                });
                              },
                              onLoadStop:
                                  (InAppWebViewController controller, url) {
                                setState(() {
                                  this.url = url!;
                                });
                              },
                              onProgressChanged:
                                  (InAppWebViewController controller,
                                      int progress) {
                                setState(() {
                                  this.progress = progress / 100;
                                  print('onProgressChangeAmr $progress');
                                });
                              },
                            )),
                  );
                },
                child: CustomNetworkImage(
                  imageUrl: state.homeSliders!.data![index]!.image!,
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
        );
      } else {
        return FirstSliderShimmerWidget();
      }
    });
  }
}
