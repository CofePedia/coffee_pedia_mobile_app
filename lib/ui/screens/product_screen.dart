import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:coffepedia/ui/shared/custom_outline_button.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../checkout_popup.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int counter = 1;
  int _selectedIndex = 0;
  final List<String> weight = [
    '12 Ounce (Pack of 6)',
    '18 Ounce (Pack of 3)',
    '18 Ounce (Pack of 6)',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        height: 107.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.04),
              blurRadius: 2.r,
            )
          ],
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.r),
            topRight: Radius.circular(22.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              onPress: () {
                setState(() {
                  counter++;
                });
              },
              height: 50.h,
              width: 50.w,
              borderRadius: 35.r,
              buttonColor: Color(0xffF2F2F2),
              assetName: Assets.iconsAdd,
              imageWidth: 15.w,
              imageHeight: 15.h,
              imageColor: Color(0xff606266),
            ),
            Container(
              width: 50.w,
              height: 50.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(
                  color: Color(0xffF3F1F1),
                ),
              ),
              child: Text(
                '$counter'.toString(),
                // textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Color(
                        0xff606266,
                      ),
                    ),
              ),
            ),
            CustomButton(
              onPress: () {
                setState(() {
                  counter--;
                });
              },
              height: 50.h,
              width: 50.w,
              borderRadius: 35.r,
              buttonColor: Color(0xffF2F2F2),
              imageColor: Color(0xff606266),
              assetName: Assets.iconsMinus,
              imageHeight: 15.h,
              imageWidth: 15.w,
            ),
            CustomButton(
              onPress: () {
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
                  builder: (context) => CheckoutPopUp(),
                );
              },
              width: 170.w,
              height: 50.h,
              assetName: Assets.iconsShoppingBasket,
              borderRadius: 25.r,
              title: 'Add to basket',
              buttonColor: Theme.of(context).primaryColor,
              imageColor: Theme.of(context).accentColor,
              imageHeight: 18.h,
              imageWidth: 24.w,
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffFFD008),
              Color(0xffFFE77E),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 45.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 23.h, horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.chevron_left,
                        size: 30.w,
                      ),
                      color: Color(0xff000000),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        Assets.iconsShoppingBasket,
                        width: 24.w,
                        color: Color(0xff000000),
                        height: 18.h,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1210.h,
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Positioned(
                      top: 192.h,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1200.h,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35.r),
                            topRight: Radius.circular(35.r),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 87.h, right: 15.w, left: 15.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  Container(
                                    height: 38.h,
                                    width: 38.w,
                                    decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(25.r),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.12),
                                            offset: Offset(0, 2),
                                            blurRadius: 11.r)
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
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15.h, right: 15.w, left: 15.w),
                              child: Text(
                                  'CoffePedia Dark Espresso Roast COFFEE',
                                  style: Theme.of(context).textTheme.headline1),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15.h, right: 12.w, left: 12.w),
                              child: Container(
                                height: 12.h,
                                width: 200.w,
                                child: RatingBar.builder(
                                  itemSize: 13.h,
                                  initialRating: 4,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0.w),
                                  itemBuilder: (context, _) => SvgPicture.asset(
                                      'assets/icons/star_active.svg'),
                                  onRatingUpdate: (rating) {
                                    print('rating_bar: $rating');
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15.h, right: 15.w, left: 15.w),
                              child: Text(
                                'EGP 450',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.black45,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 8.h, right: 15.w, left: 15.w),
                              child: Text(
                                'EGP 340',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15.h, right: 12.w, left: 12.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: weight.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.only(left: 6.w),
                                    child: CustomOutlineButton(
                                      title: weight[index],
                                      height: 40.h,
                                      width: 152.w,
                                      onPress: () {
                                        setState(() {
                                          _selectedIndex = index;
                                        });
                                      },
                                      shadowColor: BoxShadow(
                                        color: _selectedIndex == index
                                            ? Color.fromARGB(41, 16, 124, 192)
                                            : Colors.transparent,
                                        blurRadius: 7.r,
                                      ),
                                      borderRadius: 4.r,
                                      borderColor: _selectedIndex == index
                                          ? Theme.of(context).primaryColor
                                          : Color(0xffE3E3E3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 24.h, right: 15.w, left: 15.w),
                              child: Text(
                                'About this item',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15.h, right: 15.w, left: 15.w),
                              child: Text(
                                'Sumatra coffee is a dark-roasted, full-bodied coffee with spicy and herbal notes and a deep, earthy aroma',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15.w, left: 15.w),
                              child: Text(
                                'Darker-roasted coffees have fuller body with robust, bold taste',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15.w, left: 15.w),
                              child: Text(
                                'Enjoy Starbucks at home. The coffee you love without leaving the house',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15.w, left: 15.w),
                              child: Text(
                                'For finest taste, always use clean, filtered water; clean your machine before using; and grind beans just before brewing',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15.w, left: 15.w),
                              child: Text(
                                'Each pack includes 6 12-ounce bags of whole-bean Starbucks coffee',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15.h),
                              child: Container(
                                height: 5.h,
                                width: MediaQuery.of(context).size.width,
                                color: Color(0xffEFEFEF),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 24.h, right: 15.w, left: 15.w),
                              child: Text(
                                'Product overview',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15.h, right: 15.w, left: 15.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Flavor',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                              color: Color(
                                                0xff8A8A8A,
                                              ),
                                            ),
                                      ),
                                      Text(
                                        'Sumatra WB',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                      SizedBox(height: 18.h),
                                      Text(
                                        'Brand',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                              color: Color(
                                                0xff8A8A8A,
                                              ),
                                            ),
                                      ),
                                      Text(
                                        'Starbucks',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                      SizedBox(height: 18.h),
                                      Text(
                                        'Item Form',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                              color: Color(
                                                0xff8A8A8A,
                                              ),
                                            ),
                                      ),
                                      Text(
                                        'Whole Beans',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Package Information',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                              color: Color(
                                                0xff8A8A8A,
                                              ),
                                            ),
                                      ),
                                      Text(
                                        'Bag',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                      SizedBox(height: 18.h),
                                      Text(
                                        'Specialty',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                              color: Color(
                                                0xff8A8A8A,
                                              ),
                                            ),
                                      ),
                                      Text(
                                        'Single Origin',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15.h),
                              child: Container(
                                height: 5.h,
                                width: MediaQuery.of(context).size.width,
                                color: Color(0xffEFEFEF),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 24.h, right: 15.w, left: 15.w),
                              child: Text(
                                'About seller',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: ListTile(
                                leading: Image.asset(Assets.imagesPartnerLogo),
                                title: Text(
                                  'Seller name',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                        color: Color(
                                          0xff8A8A8A,
                                        ),
                                      ),
                                ),
                                subtitle: Text(
                                  'D.Cappuccino Café',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 13.h),
                              child: Container(
                                padding: EdgeInsets.only(left: 15.w),
                                height: 47.h,
                                width: MediaQuery.of(context).size.width,
                                color: Color(0xffDDF0FC),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 35.h,
                                      width: 35.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Color(0xffDDF0FC),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            19.5.r,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        '3',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 14.sp,
                                            ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      'Other offers from EGP 240',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 14.sp,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0.h,
                      left: 116.h,
                      right: 116.h,
                      child: Image.asset(
                        Assets.imagesPack,
                        height: 260.h,
                        width: 142.w,
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
