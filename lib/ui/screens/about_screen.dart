import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../main.dart';
import 'check_internet_connection.dart';
import 'map_viewer_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
      screen: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 60.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 16.h, left: 18.w, right: 18.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.chevron_left,
                          size: 24.w,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        translator.translate("about_screen.about_coffePedia"),
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 18.sp,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 196.h,
                  width: 375.w,
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: 0.4,
                        child: Container(
                          height: 196.h,
                          width: 375.w,
                          child: Image.asset(
                            Assets.coffeeCars,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          Assets.iconsCoffePediaLogo,
                          height: 70.h,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 21.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    translator.translate("about_screen.our_story"),
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                SizedBox(
                  height: 11.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    translator.translate("about_screen.our_story_first_paragraph"),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    translator.translate("about_screen.our_story_second_paragraph"),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    translator.translate("about_screen.what_we_believe"),
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    translator.translate("about_screen.what_we_believe_first_paragraph"),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    translator.translate("about_screen.our_partners"),
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    translator.translate("about_screen.our_partners_first_paragraph"),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 12,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20.h,
                      //  crossAxisSpacing: 5.w,
                      childAspectRatio: 130.w / 40.h,
                    ),
                    itemBuilder: (context, index) => Image.asset(
                      Assets.imagesPartnerLogo1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 32.83.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: MapViewerWidget(),
                ),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.email),
                      SizedBox(
                        width: 13.w,
                      ),
                      Text(
                        'info@coffepedia.ca',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.locationPin),
                      SizedBox(
                        width: 13.w,
                      ),
                      Text(
                        ' Montreal, Quebec',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.web),
                      SizedBox(
                        width: 13.w,
                      ),
                      Text(
                        'www.coffepedia.com.ca',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
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
                      SvgPicture.asset(
                        Assets.facebookLogo,
                        height: 16.h,
                        width: 8.5.w,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      SvgPicture.asset(
                        Assets.twitterLogo,
                        height: 16.h,
                        width: 8.5.w,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      SvgPicture.asset(
                        Assets.instagramLogo,
                        height: 16.h,
                        width: 8.5.w,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      SvgPicture.asset(
                        Assets.youtubeLogo,
                        height: 16.h,
                        width: 8.5.w,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
