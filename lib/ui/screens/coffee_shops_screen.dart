import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/show_on_map_bottom_sheet.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:coffepedia/ui/shared/custom_outline_button.dart';
import 'package:coffepedia/ui/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class CoffeeShopsScreen extends StatelessWidget {
  const CoffeeShopsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60.h, bottom: 24.h),
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
                      'Coffee shops',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 18.sp,
                          ),
                    ),
                  ],
                ),
              ),
              Text(
                'Coffee shops nearby you',
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomTextFormField(
                hintText: 'Search …',
                width: 345.w,
                keyboardType: TextInputType.text,
                height: 43.h,
                prefix: SvgPicture.asset(
                  Assets.iconsSearch,
                  fit: BoxFit.none,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                height: 43.h,
                width: 345.w,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.23),
                      blurRadius: 11.sp,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: DropdownButton(
                  items: [],
                  onTap: () {},
                  isExpanded: true,
                  icon: Icon(
                    Icons.expand_more,
                    color: Color(0xff8A8A8A),
                  ),
                  hint: Text(
                    'Select Area',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomButton(
                onPress: () {},
                title: 'Search',
                height: 50.h,
                width: 345.w,
                imageWidth: 0,
                imageHeight: 0,
                buttonColor: Theme.of(context).primaryColor,
                borderRadius: 25.sp,
                imageColor: Colors.transparent,
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Coffee shops ',
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(
                                    fontSize: 18.sp,
                                  ),
                        ),
                        TextSpan(
                          text: '(156 Item)',
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(
                                    fontSize: 12.sp,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  CustomOutlineButton(
                    title: 'Filter',
                    onPress: () {},
                    height: 40.h,
                    width: 100.w,
                    borderRadius: 9.r,
                    shadowColor: BoxShadow(color: Colors.transparent),
                    imageColor: Theme.of(context).primaryColor,
                    assetName: Assets.iconsFilter,
                    borderColor: Theme.of(context).primaryColor,
                    imageWidth: 20.w,
                    imageHeight: 18.h,
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    enableDrag: false,
                    isDismissible: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.r),
                        topRight: Radius.circular(25.r),
                      ),
                    ),
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => ShowOnMapBottomSheet(),
                  );
                },
                child: Container(
                  width: 343.w,
                  height: 190.h,
                  padding: EdgeInsets.all(12.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.12),
                        blurRadius: 11.sp,
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(9.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Starbucks Coffe',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(fontSize: 14.sp),
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            Assets.iconsStarActive),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          '4.5',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                fontWeight: FontWeight.w700,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 9.h,
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
                                  height: 9.h,
                                ),
                                Container(
                                  width: 74.w,
                                  height: 20.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color(
                                      0xffE9E7E7,
                                    ),
                                    borderRadius: BorderRadius.circular(17.5.r),
                                  ),
                                  child: Text(
                                    'Takeaway',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                SizedBox(
                                  height: 9.h,
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
                          )
                        ],
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      Expanded(
                        child: Text(
                          'Start playing for a chance to win over 2.2 Million prizes inclduing free drinks, exclusive merchandise and a Bose Speaker!.',
                          style: Theme.of(context).textTheme.headline4,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                width: 343.w,
                height: 190.h,
                padding: EdgeInsets.all(12.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.12),
                      blurRadius: 11.sp,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(9.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Cafe Greco',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(fontSize: 14.sp),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(Assets.iconsStarActive),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        '4.5',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 9.h,
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
                                height: 9.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 3.h, horizontal: 12.w),
                                    height: 20.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(
                                        0xffE9E7E7,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(17.5.r),
                                    ),
                                    child: Text(
                                      'Takeaway',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Container(
                                    height: 20.h,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 3.h, horizontal: 12.w),
                                    decoration: BoxDecoration(
                                      color: Color(
                                        0xffE9E7E7,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(17.5.r),
                                    ),
                                    child: Text(
                                      'Dounts',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 9.h,
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
                        )
                      ],
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Expanded(
                      child: Text(
                        "Since we opened back in 2009, Uncle Benny's Donut & Bagel has had one mission: showing the people of San Francisco what a donut truly.",
                        style: Theme.of(context).textTheme.headline4,
                        maxLines: 3,
                      ),
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

// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// 'Select Area',
// style: Theme.of(context).textTheme.bodyText1!.copyWith(
// fontSize: 14.sp,
// fontWeight: FontWeight.w500,
// ),
// ),
// Icon(
// Icons.expand_more,
// color: Color(0xff8A8A8A),
// ),
// ],
// ),
