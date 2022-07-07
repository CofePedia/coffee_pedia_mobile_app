import 'package:coffepedia/business_logic/about_cofepedia/about_cofepedia_cubit.dart';
import 'package:coffepedia/data/repository/about_cofepedia_repository.dart';
import 'package:coffepedia/data/web_services/about_cofepedia_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/shared/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import 'check_internet_connection.dart';
import 'map_viewer_widget.dart';

class AboutCofepediaScreen extends StatelessWidget {
  const AboutCofepediaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutCofepediaCubit(
        AboutCofepediaRepository(
          AboutCofepediaWebServices(),
        ),
      ),
      child: AboutScreen(),
    );
  }
}

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    BlocProvider.of<AboutCofepediaCubit>(context).getAboutCofepedia();
    super.initState();
  }

  void _launchURL(String? _url) async {
    if (!await launch(_url!)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
      screen: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 60.h),
            child: BlocBuilder<AboutCofepediaCubit, AboutCofepediaState>(
              builder: (context, state) {
                if (state is AboutCofepediaIsLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.h, left: 18.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20.w,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              state.aboutCofePedia!.data!.details!.title ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    fontSize: 18.sp,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      state.aboutCofePedia!.data!.details!.image == null &&
                              state.aboutCofePedia!.data!.details!.image == ""
                          ? CustomNetworkImage(
                              width: MediaQuery.of(context).size.width,
                              height: 200.h,
                              radius: 2,
                              imageUrl:
                                  state.aboutCofePedia!.data!.details!.image!,
                            )
                          : SizedBox.shrink(),
                      // Container(
                      //   height: 196.h,
                      //   width: 375.w,
                      //   child: Stack(
                      //     children: [
                      //       Container(
                      //         height: 196.h,
                      //         width: 375.w,
                      //         child: CustomNetworkImage(
                      //           width: MediaQuery.of(context).size.width,
                      //           height: 200.h,
                      //           radius: 2,
                      //           imageUrl:
                      //               state.aboutCofePedia!.data!.details!.image!,
                      //         ),
                      //         // child: Image.asset(
                      //         //   Assets.coffeeCars,
                      //         //   fit: BoxFit.cover,
                      //         // ),
                      //       ),
                      //       Center(
                      //         child: Image.asset(
                      //           Assets.iconsCoffePediaLogo,
                      //           height: 70.h,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: 11.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          state.aboutCofePedia!.data!.details!.description ??
                              "",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: state
                            .aboutCofePedia!.data!.details!.feature!.length,
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Text(
                                state.aboutCofePedia!.data!.details!
                                        .feature![index]!.title ??
                                    '',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                            SizedBox(
                              height: 11.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Text(
                                state.aboutCofePedia!.data!.details!
                                        .feature![index]!.description ??
                                    '',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                            SizedBox(
                              height: 11.h,
                            ),
                            state.aboutCofePedia!.data!.details!
                                            .feature![index]!.image ==
                                        null &&
                                    state.aboutCofePedia!.data!.details!
                                            .feature![index]!.image ==
                                        ""
                                ? CustomNetworkImage(
                                    width: MediaQuery.of(context).size.width,
                                    height: 200.h,
                                    radius: 2,
                                    imageUrl: state
                                        .aboutCofePedia!.data!.details!.image!,
                                  )
                                : SizedBox.shrink(),
                            SizedBox(
                              height: 11.h,
                            ),
                          ],
                        ),
                      ),
                      //
                      // SizedBox(
                      //   height: 8.h,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 15.w),
                      //   child: Text(
                      //     translator.translate(
                      //         "about_screen.our_story_second_paragraph"),
                      //     style: Theme.of(context).textTheme.headline4,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 32.h,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 15.w),
                      //   child: Text(
                      //     translator.translate("about_screen.what_we_believe"),
                      //     style: Theme.of(context).textTheme.caption,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 12.h,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 15.w),
                      //   child: Text(
                      //     translator.translate(
                      //         "about_screen.what_we_believe_first_paragraph"),
                      //     style: Theme.of(context).textTheme.headline4,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 32.h,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 15.w),
                      //   child: Text(
                      //     translator.translate("about_screen.our_partners"),
                      //     style: Theme.of(context).textTheme.caption,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 12.h,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 15.w),
                      //   child: Text(
                      //     translator.translate(
                      //         "about_screen.our_partners_first_paragraph"),
                      //     style: Theme.of(context).textTheme.headline4,
                      //   ),
                      // ),
                      SizedBox(
                        height: 20.h,
                      ),
                      state.aboutCofePedia!.data!.brands!.isNotEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: GridView.builder(
                                padding: EdgeInsets.zero,
                                itemCount:
                                    state.aboutCofePedia!.data!.brands!.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 20.h,
                                  crossAxisSpacing: 5.w,
                                  childAspectRatio: 130.w / 40.h,
                                ),
                                itemBuilder: (context, index) =>
                                    CustomNetworkImage(
                                  width: 80.w,
                                  height: 30.h,
                                  fit: BoxFit.contain,
                                  radius: 2.h,
                                  imageUrl: state
                                      .aboutCofePedia!.data!.brands![index]!,
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: 32.83.h,
                      ),
                      state.aboutCofePedia!.data!.setting!.lat != null &&
                              state.aboutCofePedia!.data!.setting!.lat != '' &&
                              state.aboutCofePedia!.data!.setting!.lng !=
                                  null &&
                              state.aboutCofePedia!.data!.setting!.lng != ''
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: MapViewerWidget(
                                address: state
                                    .aboutCofePedia!.data!.setting!.address!,
                                latitude:
                                    state.aboutCofePedia!.data!.setting!.lat ??
                                        '',
                                longitude:
                                    state.aboutCofePedia!.data!.setting!.lng ??
                                        '',
                                controller: MapController(
                                  location: LatLng(
                                      double.parse(state.aboutCofePedia!.data!
                                              .setting!.lat ??
                                          ''),
                                      double.parse(state.aboutCofePedia!.data!
                                              .setting!.lng ??
                                          '')),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: 30.8.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          translator.translate("about_screen.contacts"),
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      state.aboutCofePedia!.data!.setting!.email != null &&
                              state.aboutCofePedia!.data!.setting!.email != ''
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Row(
                                children: [
                                  SvgPicture.asset(Assets.email),
                                  SizedBox(
                                    width: 13.w,
                                  ),
                                  Text(
                                    state.aboutCofePedia!.data!.setting!
                                            .email ??
                                        '',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: 7.h,
                      ),
                      state.aboutCofePedia!.data!.setting!.address != null &&
                              state.aboutCofePedia!.data!.setting!.address != ''
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Row(
                                children: [
                                  SvgPicture.asset(Assets.locationPin),
                                  SizedBox(
                                    width: 13.w,
                                  ),
                                  Text(
                                    state.aboutCofePedia!.data!.setting!
                                            .address ??
                                        '',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: 7.h,
                      ),
                      state.aboutCofePedia!.data!.setting!.website != null &&
                              state.aboutCofePedia!.data!.setting!.website != ''
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Row(
                                children: [
                                  SvgPicture.asset(Assets.web),
                                  SizedBox(
                                    width: 13.w,
                                  ),
                                  Text(
                                    state.aboutCofePedia!.data!.setting!
                                            .website ??
                                        '',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: 32.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          translator.translate("about_screen.follow_us"),
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          children: [
                            state.aboutCofePedia!.data!.setting!.facebook !=
                                        null &&
                                    state.aboutCofePedia!.data!.setting!
                                            .facebook !=
                                        ''
                                ? InkWell(
                                    onTap: () {
                                      _launchURL(state.aboutCofePedia!.data!
                                          .setting!.facebook);
                                    },
                                    child: SvgPicture.asset(
                                      Assets.facebookLogo,
                                      height: 16.h,
                                      width: 8.5.w,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  )
                                : SizedBox.shrink(),
                            SizedBox(
                              width: 8.w,
                            ),
                            state.aboutCofePedia!.data!.setting!.twitter !=
                                        null &&
                                    state.aboutCofePedia!.data!.setting!
                                            .twitter !=
                                        ''
                                ? InkWell(
                                    onTap: () {
                                      _launchURL(state.aboutCofePedia!.data!
                                          .setting!.twitter);
                                    },
                                    child: SvgPicture.asset(
                                      Assets.twitterLogo,
                                      height: 16.h,
                                      width: 8.5.w,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  )
                                : SizedBox.shrink(),
                            SizedBox(
                              width: 8.w,
                            ),
                            state.aboutCofePedia!.data!.setting!.instagram !=
                                        null &&
                                    state.aboutCofePedia!.data!.setting!
                                            .instagram !=
                                        ''
                                ? InkWell(
                                    onTap: () {
                                      _launchURL(state.aboutCofePedia!.data!
                                          .setting!.instagram);
                                    },
                                    child: SvgPicture.asset(
                                      Assets.instagramLogo,
                                      height: 16.h,
                                      width: 8.5.w,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  )
                                : SizedBox.shrink(),
                            SizedBox(
                              width: 8.w,
                            ),
                            state.aboutCofePedia!.data!.setting!.youtube !=
                                        null &&
                                    state.aboutCofePedia!.data!.setting!
                                            .youtube !=
                                        ''
                                ? InkWell(
                                    onTap: () {
                                      _launchURL(state.aboutCofePedia!.data!
                                          .setting!.youtube);
                                    },
                                    child: SvgPicture.asset(
                                      Assets.youtubeLogo,
                                      height: 16.h,
                                      width: 8.5.w,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
