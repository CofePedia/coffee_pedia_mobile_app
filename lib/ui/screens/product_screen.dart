import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:coffepedia/ui/shared/custom_outline_button.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/filters_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:favorite_button/favorite_button.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool? isSelected;
  int counter = 1;
  int selectedIndex = 0;
  final List<String> weight = [
    '12 Ounce (Pack of 6)',
    '18 Ounce (Pack of 3)',
    '18 Ounce (Pack of 6)',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        height: 107.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.18),
              blurRadius: 6.sp,
            )
          ],
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.5.h),
            topRight: Radius.circular(12.5.h),
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
              borderRadius: 35.sp,
              buttonColor: Color(0xffF2F2F2),
              assetName: Assets.addIcon,
              imageWidth: 15.w,
              imageHeight: 15.h,
            ),
            Container(
              padding: EdgeInsets.all(12),
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(14.sp),
                border: Border.all(
                  color: Color(0xffF3F1F1),
                ),
              ),
              child: Text(
                '$counter'.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp, color: Color(0xff606266)),
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
              borderRadius: 35.sp,
              buttonColor: Color(0xffF2F2F2),
              imageColor: Color(0xff606266),
              assetName: Assets.minusIcon,
              imageHeight: 20.h,
              imageWidth: 15.h,
            ),
            CustomButton(
              onPress: () {},
              width: 170.w,
              height: 50.h,
              assetName: Assets.iconsShoppingBasket,
              borderRadius: 25.sp,
              title: 'Add to basket',
              buttonColor: Color(0xff107CC0),
              imageColor: Color(0xffFFFFFF),
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
                      onPressed: () {},
                      icon: Icon(
                        Icons.chevron_left,
                        size: 30.w,
                      ),
                      color: Color(0xff000000),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          enableDrag: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.h),
                              topRight: Radius.circular(15.w),
                            ),
                          ),
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => FiltersScreen(),
                        );
                      },
                      child: SvgPicture.asset(
                        Assets.iconsShoppingBasket,
                        width: 24.w,
                        height: 18.h,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1091.h,
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Positioned(
                      top: 192.h,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        //height: 1200.h,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35.h),
                            topRight: Radius.circular(35.h),
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
                                    padding: EdgeInsets.all(3),
                                    height: 17.h,
                                    width: 55.h,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFFD008),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12.5.h),
                                          bottomRight: Radius.circular(12.5.h),
                                          bottomLeft: Radius.circular(12.5.h)),
                                    ),
                                    child: Text(
                                      '25% Off',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'Nexa_Bold_Regular'),
                                    ),
                                  ),
                                  Container(
                                    height: 38.h,
                                    width: 38.w,
                                    decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.12),
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
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15.h, right: 15.w, left: 15.w),
                              child: Text(
                                'CoffePedia Dark Espresso Roast COFFEE',
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  color: Color(0xff000000),
                                  fontFamily: 'Nexa_Bold_Regular',
                                ),
                              ),
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
                                      EdgeInsets.symmetric(horizontal: 4.0),
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
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontFamily: 'Nexa_Bold_Regular',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 8.h, right: 15.w, left: 15.w),
                              child: Text(
                                'EGP 340',
                                style: TextStyle(
                                  color: Color(0xff4470C1),
                                  fontSize: 18.sp,
                                  fontFamily: 'Nexa_Bold_Regular',
                                ),
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
                                    padding: const EdgeInsets.only(left: 6),
                                    child: CustomOutlineButton(
                                      title: weight[index],
                                      borderColor: selectedIndex == index
                                          ? Theme.of(context).primaryColor
                                          : Color(0xffE3E3E3),
                                      onPress: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                      height: 40.h,
                                      width: 152.w,
                                      boxShadow: [
                                        BoxShadow(
                                          color: selectedIndex == index
                                              ? Color.fromRGBO(16, 124, 192, 0)
                                              : Colors.transparent,
                                          blurRadius: 7.sp,
                                          // offset: Offset(0, 0),
                                          // spreadRadius: 0,
                                        ),
                                      ],
                                      borderRadius: 5,
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
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15.h, right: 15.w, left: 15.w),
                              child: Text(
                                'Sumatra coffee is a dark-roasted, full-bodied coffee with spicy and herbal notes and a deep, earthy aroma',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15.w, left: 15.w),
                              child: Text(
                                'Darker-roasted coffees have fuller body with robust, bold taste',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15.w, left: 15.w),
                              child: Text(
                                'Enjoy Starbucks at home. The coffee you love without leaving the house',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15.w, left: 15.w),
                              child: Text(
                                'For finest taste, always use clean, filtered water; clean your machine before using; and grind beans just before brewing',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15.w, left: 15.w),
                              child: Text(
                                'Each pack includes 6 12-ounce bags of whole-bean Starbucks coffee',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                ),
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
                                style: TextStyle(fontSize: 16.sp),
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
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Color(0xff8A8A8A),
                                        ),
                                      ),
                                      Text(
                                        'Sumatra WB',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Color(0xff231F20),
                                        ),
                                      ),
                                      SizedBox(height: 18),
                                      Text(
                                        'Brand',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Color(0xff8A8A8A),
                                        ),
                                      ),
                                      Text(
                                        'Starbucks',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Color(0xff231F20),
                                        ),
                                      ),
                                      SizedBox(height: 18),
                                      Text(
                                        'Item Form',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Color(0xff8A8A8A),
                                        ),
                                      ),
                                      Text(
                                        'Whole Beans',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Color(0xff231F20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Package Information',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Color(0xff8A8A8A),
                                        ),
                                      ),
                                      Text(
                                        'Bag',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Color(0xff231F20),
                                        ),
                                      ),
                                      SizedBox(height: 18),
                                      Text(
                                        'Specialty',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Color(0xff8A8A8A),
                                        ),
                                      ),
                                      Text(
                                        'Single Origin',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Color(0xff231F20),
                                        ),
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
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: ListTile(
                                leading: Image.asset(Assets.imagesPartnerLogo),
                                title: Text(
                                  'Seller name',
                                  style: TextStyle(
                                      color: Color(0xff979293),
                                      fontSize: 13.sp),
                                ),
                                subtitle: Text(
                                  'D.Cappuccino Café',
                                  style: TextStyle(
                                      color: Color(0xff107CC0),
                                      fontSize: 13.sp),
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
                                      padding: EdgeInsets.all(10),
                                      height: 35.h,
                                      width: 35.w,
                                      decoration: BoxDecoration(
                                        color: Color(0xffBFE1F9),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(19.5)),
                                      ),
                                      child: Text(
                                        '3',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 14.sp),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Other offers from EGP 240',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14.sp),
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
