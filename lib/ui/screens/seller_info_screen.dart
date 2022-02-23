import 'package:coffepedia/constants/colors.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/shared/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SellerInfoScreen extends StatelessWidget {
  const SellerInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 60.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 31.h, left: 18.w, right: 18.w),
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
                      'Seller info',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 18.sp,
                          ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: CircleAvatar(
                      radius: 40.sp,
                      child: Image.asset(
                        Assets.imagesPartnerLogo,
                        fit: BoxFit.fill,
                        width: 75.w,
                        height: 90.h,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'D.Cappuccino Cafe',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.room,
                            size: 16.h,
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text('City Square Mall, Cairo Governorate'),
                        ],
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      RatingBarComponent(
                        rate: 4,
                      ),
                      SizedBox(
                        height: 14.74.h,
                      ),
                      Container(
                        // width: 100,
                        height: 28.h,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 3.h, horizontal: 12.w),
                            // height: 20.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(
                                0xffE9E7E7,
                              ),
                              borderRadius: BorderRadius.circular(17.5.r),
                            ),
                            child: Text(
                              'Takeaway',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          itemCount: 1,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.done,
                            color: Color(0xff14B93B),
                            size: 15.h,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text('Delivery'),
                          SizedBox(
                            width: 10.w,
                          ),
                          Icon(
                            Icons.done,
                            color: Color(0xff14B93B),
                            size: 15.h,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text('Outdoor dinning'),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Divider(
                // height: 2.h,
                thickness: 5.h, color: kGrey6,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: CircleAvatar(
                      backgroundColor: kGrey7,
                      radius: 40.sp,
                      child: Text(
                        '4.6',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 22.sp),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 5,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('5 Stars'),
                            LinearPercentIndicator(
                              width: 201.0.w,
                              barRadius: Radius.circular(3.sp),
                              lineHeight: 6.h,
                              percent: 0.5,
                              backgroundColor: kGrey8,
                              progressColor: kYellow2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
