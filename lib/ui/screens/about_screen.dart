import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'map_viewer_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 60.h),
          child: Column(
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
                        Icons.chevron_left,
                        size: 24.w,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'About Coffepedia',
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
                  'Our Story',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              SizedBox(
                height: 11.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  'We are a family-owned neighborhood breakfast and lunch restaurant located near Los Angeles International Airport (LAX). We take pride in providing friendly and swift service to our local patrons and those who are traveling or are "on the go". ',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  'It is also a very labor intensive process involving a vast intercontinental collaboration that starts with the coffee grower, moves from there to the picker, then to the mill workers who meticulously remove the fruit and dry the beans, then to those who clean and grade the beans, to those who roast them, to those consumers and baristas who finally grind the beans and prepare the beverage. Every act along the way can be performed either with passion and precision or with careless shoddiness. It is the cumulative quality of all of these creative contributions that together make the difference between a lackluster cup and a fine and distinctive one.',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  'What we belive',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  'Our values shape the culture of our organization and define the character of our company. We live the core values through individual behaviors. They serve as the foundation for how we act and make decisions.',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  'Our partners',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  'Our network includes a diverse group of development agencies, government organizations, local and national organizations, and other international NGOs. This network is a valuable asset in enabling ICP and its partners to achieve a better future for the millions of smallholder coffee farmer families worldwide.',
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
                  'Contacts',
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
                  'Follow us',
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
    );
  }
}
