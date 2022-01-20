import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffepedia/business_logic/product/product_cubit.dart';
import 'package:coffepedia/data/repository/product_repository.dart';
import 'package:coffepedia/data/web_services/product_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:coffepedia/ui/shared/custom_outline_button.dart';
import 'package:coffepedia/ui/shared/wishlist_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../checkout_popup.dart';

class ProductProvider extends StatelessWidget {
  const ProductProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        ProductRepository(
          ProductWebServices(),
        ),
      ),
      child: ProductScreen(),
    );
  }
}

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
  final List<String> overview = ['region', 'Brand', 'roast', 'flavor'];
  @override
  void initState() {
    BlocProvider.of<ProductCubit>(context).getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded) {
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
                  InkWell(
                    onTap: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Color(0xffF2F2F2),
                      radius: 27.h,
                      child: Icon(
                        Icons.add,
                        size: 20.r,
                        color: Color(0xff606266),
                      ),
                    ),
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
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Color(
                              0xff606266,
                            ),
                          ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        counter--;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Color(0xffF2F2F2),
                      radius: 27.h,
                      child: Icon(
                        Icons.remove,
                        size: 20.r,
                        color: Color(0xff606266),
                      ),
                    ),
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
                        builder: (context) => CheckoutPopUp(
                          title: state.product!.data!.name,
                          image: state.product!.data!.image,
                          totalPrice: state.product!.data!.price.toString(),
                        ),
                      );
                    },
                    width: 170.w,
                    height: 50.h,
                    assetName: Assets.iconsShoppingBasket,
                    borderRadius: 25.r,
                    title: 'Add to basket',
                    buttonColor: Theme.of(context).primaryColor,
                    imageColor: Theme.of(context).colorScheme.secondary,
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
                      padding: EdgeInsets.symmetric(
                          vertical: 23.h, horizontal: 16.w),
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
                      height: 280.h,
                      child: Stack(
                        fit: StackFit.loose,
                        children: [
                          Positioned(
                            top: 192.h,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 280.h,
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35.r),
                                  topRight: Radius.circular(35.r),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20.h,
                            left: 116.h,
                            right: 116.h,
                            child: Container(
                              height: 200.h,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: false,
                                  enlargeCenterPage: true,
                                ),
                                items:
                                    state.product!.data!.images!.map((image) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    child: Image.network(
                                      image!,
                                      fit: BoxFit.fill,
                                      // height: 260.h,
                                      // width: 142.w,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          // Positioned(
                          //   top: 0.h,
                          //   left: 116.h,
                          //   right: 116.h,
                          //   child: Image.network(
                          //     // TODO: it should be list of images with slider
                          //
                          //     state.product!.data!.images![0]!,
                          //     height: 260.h,
                          //     width: 142.w,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 15.w, left: 15.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    '${state.product!.data!.discount}% Off',
                                    textAlign: TextAlign.center,
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
                                          color: Color.fromRGBO(0, 0, 0, 0.12),
                                          offset: Offset(0, 2),
                                          blurRadius: 11.r)
                                    ],
                                  ),
                                  child: WishlistIconWidget(
                                    productId:
                                        state.product!.data!.id.toString(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 15.h, right: 15.w, left: 15.w),
                            child: Text(
                              state.product!.data!.name!,
                              style: Theme.of(context).textTheme.headline1,
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
                                itemCount: state.product!.data!.rate!,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0.w),
                                itemBuilder: (context, _) => SvgPicture.asset(
                                  'assets/icons/star_active.svg',
                                ),
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
                              'EGP ${state.product!.data!.priceBeforeDiscount!}',
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
                              'EGP ${state.product!.data!.price!}',
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
                                    width: 160.w,
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
                              state.product!.data!.description!,
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
                            padding: EdgeInsets.only(top: 15.h),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: GridView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: 4,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8.h,
                                  childAspectRatio: 130.w / 30.h,
                                ),
                                itemBuilder: (context, index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                  ],
                                ),
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
                          Container(
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
                                          color: Theme.of(context).primaryColor,
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
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 14.sp,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
