import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/screens/recipes_details_bottom_sheet.dart';
import 'package:coffepedia/ui/screens/taps_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
        screen: Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60.h, bottom: 46.6.h, left: 18.w),
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
                      'Recipes',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 18.sp,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  'Popular Recipes',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 18.sp,
                      ),
                ),
              ),
              SizedBox(
                height: 27.54.h,
              ),
              InkWell(
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
                    builder: (context) => RecipesDetailsBottomSheet(),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 207.h,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 10.w),
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150.h,
                              width: 150.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.r),
                                child: Image.asset(
                                  Assets.coffee,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              'French Cafe au Lait',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 14.sp),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            InkWell(
                              child: Text(
                                'View Recipe',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      color: Color(0xff007CC6),
                                    ),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 5.h,
                color: Color(0xffEFEFEF),
              ),
              Container(
                margin: EdgeInsets.only(top: 24.h, bottom: 24.h),
                height: 40.h,
                child: TapsWidgets(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  'Coffee Recipes',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 18.sp,
                      ),
                ),
              ),
              SizedBox(
                height: 24.54.h,
              ),
              Container(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 6.h),
                    height: 106.h,
                    width: 343.w,
                    padding: EdgeInsets.all(12.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.r),
                      color: Colors.white,
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Color.fromRGBO(0, 0, 0, 0.12),
                      //     offset: Offset(0, 2),
                      //     blurRadius: 11.r,
                      //   )
                      // ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 80.h,
                          width: 80.w,
                          child: Image.asset(
                            Assets.imagesPack,
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
                                height: 9.h,
                              ),
                              Text(
                                'New Orleans Coffee (Cafe Noir)',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 14.sp),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                  "New Orleans is known for plenty of unique and delicious foods, including its famous hot coffee.",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.headline4),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
