import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShowOnMapBottomSheet extends StatelessWidget {
  const ShowOnMapBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216.h,
      width: 375.w,
      child: Padding(
        padding: EdgeInsets.only(top: 25.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
            Row(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Starbucks Coffe',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 11.h,
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
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 45.h,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50.h,
                width: 345.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: Theme.of(context).primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.mapIcon,
                      color: Color(0xffFFFFFF),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Text('Show on Map',
                        style: Theme.of(context).textTheme.headline2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
