import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/shared/custom_outline_button.dart';
import 'package:coffepedia/ui/widgets/category_items.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              height: 105.h,
              width: 375.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffFFD008),
                    Color(0xffFFE77E),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            CategoryItems(),
            Padding(
              padding: EdgeInsets.only(top: 31.h, right: 15.w, left: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Coffee ',
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
                    borderRadius: 9.sp,
                    shadowColor: BoxShadow(color: Colors.transparent),
                    imageColor: Theme.of(context).primaryColor,
                    assetName: Assets.iconsFilter,
                    borderColor: Theme.of(context).primaryColor,
                    imageWidth: 20.w,
                    imageHeight: 18.h,
                  ),
                ],
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 25.h,
                    crossAxisSpacing: 16.5.w,
                    childAspectRatio: 0.6,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) => Container(
                    height: 150,
                    width: 100,
                    //  color: Colors.blue,
                    padding: EdgeInsets.all(0),
                    child: Stack(
                      children: [
                        Image.asset(
                          Assets.card,
                          height: 305.h,
                          width: 165.w,
                        ),
                        Positioned(
                          right: 17.w,
                          child: Image.asset(
                            Assets.imagesPack,
                            width: 75.w,
                            height: 136.h,
                          ),
                        ),
                        Positioned(
                          top: 30.h,
                          left: 20.w,
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.iconsStaractive),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text('4.5'),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 152.h,
                          left: 12.w,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 17.h,
                                  width: 55.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFFD008),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12.5.h),
                                        bottomRight: Radius.circular(12.5.h),
                                        bottomLeft: Radius.circular(12.5.h)),
                                  ),
                                  child: Text(
                                    '25% Off',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Container(
                                  width: 140.w,
                                  child: Text(
                                    'CoffePedia Dark Espresso Roast COFFEE',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: 14.sp,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Text(
                                  'EGP 450',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.black45,
                                      ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  'EGP 340',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 240.h,
                          right: 18.w,
                          child: Container(
                            height: 38.h,
                            width: 38.w,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.12),
                                    offset: Offset(0, 2),
                                    blurRadius: 11.sp)
                              ],
                            ),
                            child: FavoriteButton(
                              isFavorite: true,
                              iconSize: 35.h,
                              iconColor: Color(0xffE02020),
                              valueChanged: (_isFavorite) {
                                print('Is Favorite $_isFavorite)');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
