import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/filters_screen.dart';
import 'package:coffepedia/ui/screens/home/search_bar.dart';
import 'package:coffepedia/ui/shared/custom_outline_button.dart';
import 'package:coffepedia/ui/widgets/category_items.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'product_screen.dart';

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
              height: 105.h,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 53.h, bottom: 9.h, right: 15.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffFFD008),
                    Color(0xffFFE77E),
                  ],
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.chevron_left,
                      size: 22.w,
                    ),
                    color: Color(0xff000000),
                  ),
                  Expanded(
                    child: SearchBar(
                      width: 309.w,
                    ),
                  ),
                ],
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
                    onPress: () {
                      showModalBottomSheet(
                        enableDrag: false,
                        isDismissible: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.r),
                            topRight: Radius.circular(15.r),
                          ),
                        ),
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => FiltersScreen(),
                      );
                    },
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
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1000.h,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 25.h,
                  crossAxisSpacing: 16.5.w,
                  childAspectRatio: 164.5.w / 305.h,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 305.h,
                    width: 164.5.w,
                    child: Stack(
                      children: [
                        Image.asset(
                          Assets.imagesCard,
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
                                  width: 55.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFFD008),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        12.5.r,
                                      ),
                                      bottomRight: Radius.circular(
                                        12.5.r,
                                      ),
                                      bottomLeft: Radius.circular(
                                        12.5.r,
                                      ),
                                    ),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}