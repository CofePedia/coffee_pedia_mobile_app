import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/taps_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'articles_details_screen.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final List<String> mainTabs = [
    'Articles',
    'Reviews',
  ];
  final List<IconData> icons = [
    Icons.article,
    Icons.reviews,
  ];
  String tab = 'Articles';
  int _currentColorTabsIndex = 0;

  final List<String> topics = [
    'Van Cafes',
    'Americano',
    'Espresso',
    'Doppio',
  ];
  String topic = 'Van Cafes';
  int _currentColorTobicIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 23.w, top: 60.h, right: 23.w, bottom: 40.5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                        'Blog',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 18.sp,
                            ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    Assets.iconsSearch,
                    fit: BoxFit.none,
                  ),
                ],
              ),
            ),
            Container(
              height: 39.5.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mainTabs.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          tab = mainTabs[index];
                          _currentColorTabsIndex = index;
                        });
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                icons[index],
                                color: _currentColorTabsIndex == index
                                    ? Theme.of(context).primaryColor
                                    : Color(0xff231F20),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                mainTabs[index],
                                style: _currentColorTabsIndex == index
                                    ? Theme.of(context).textTheme.headline6
                                    : Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(fontSize: 14.sp),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 3.h,
                            color: _currentColorTabsIndex == index
                                ? Theme.of(context).primaryColor
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              height: 5.h,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffEFEFEF),
            ),
            _currentColorTabsIndex == 0
                ? Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 16.h,
                          ),
                          height: 40.h,
                          child: TapsWidgets(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 32.86.h, left: 16.w, bottom: 18.54.h),
                          child: Text(
                            'Van Cafes Articles',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 18.sp),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 6,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  enableDrag: true,
                                  isDismissible: false,
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25.r),
                                      topRight: Radius.circular(25.r),
                                    ),
                                  ),
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) => ArticlesDetailsScreen(),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16.h, vertical: 6.h),
                                height: 106.h,
                                width: 343.w,
                                padding: EdgeInsets.all(12.h),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.r),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.12),
                                        offset: Offset(0, 2),
                                        blurRadius: 11.r,
                                      )
                                    ]),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 80.h,
                                      width: 80.w,
                                      child: Image.asset(
                                        Assets.imagesPack,
                                        height: 82.18.h,
                                        width: 107.64,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 9.h,
                                          ),
                                          Text(
                                            '11 Oct 2021',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          SizedBox(
                                            height: 15.2.h,
                                          ),
                                          Text(
                                            'The Nostalgia And Beauty Of Vintage Camper Van Cafes',
                                            maxLines: 3,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 4.h),
                      itemCount: 8,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(
                            top: 15.87.h, left: 16.w, right: 16.w),
                        child: Column(
                          children: [
                            Container(
                              height: 100.4.h,
                              child: Row(
                                children: [
                                  Container(
                                    height: 104.h,
                                    width: 140.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.sp),
                                      color: Colors.grey,
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(
                                          Assets.imagesPack,
                                          height: 82.18.h,
                                          width: 107.64,
                                        ),
                                        Center(
                                          child: SvgPicture.asset(
                                            Assets.playIcon,
                                          ),
                                        ),
                                        Positioned(
                                          right: 13.w,
                                          bottom: 9.4.h,
                                          child: Container(
                                            width: 47.w,
                                            height: 19.h,
                                            alignment: Alignment.center,
                                            child: Text(
                                              '03:33',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2!
                                                  .copyWith(fontSize: 12.sp),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3.sp),
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 11.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        Text(
                                          'Coffee Brewing Essentials w/ Tim Wendelboe',
                                          maxLines: 3,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                  fontSize: 14.sp,
                                                  height: 1.25),
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        Text(
                                          'This time, our destination was a gorgeous city of Milan, Italy and it was at Christmas time!',
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.73.h,
                            ),
                            Divider(
                              height: 1.h,
                              thickness: 2,
                              color: Color(0xffE3E3E3),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
