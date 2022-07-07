import 'package:appmetrica_sdk/appmetrica_sdk.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:coffepedia/business_logic/getx_controllers/badge_controller.dart';
import 'package:coffepedia/business_logic/me/me_cubit.dart';
import 'package:coffepedia/business_logic/product/product_cubit.dart';
import 'package:coffepedia/data/models/basket.dart';
import 'package:coffepedia/data/repository/me_repository.dart';
import 'package:coffepedia/data/repository/product_repository.dart';
import 'package:coffepedia/data/web_services/me_web_services.dart';
import 'package:coffepedia/data/web_services/product_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/services/preferences.dart';
import 'package:coffepedia/ui/screens/category_screen.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/screens/home_page.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:coffepedia/ui/shared/custom_network_image.dart';
import 'package:coffepedia/ui/shared/rating_bar.dart';
import 'package:coffepedia/ui/shared/wishlist_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../business_logic/basket/basket_cubit.dart';
import '../../data/repository/basket_repository.dart';
import '../../data/web_services/basket_web_services.dart';
import '../../main.dart';
import '../checkout_popup.dart';

class ProductProvider extends StatelessWidget {
  final int id;
  const ProductProvider({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(
          create: (_) => ProductCubit(
            ProductRepository(
              ProductWebServices(),
            ),
          ),
        ),
        BlocProvider<MeCubit>(
          create: (context) => MeCubit(
            MeRepository(
              MeWebServices(),
            ),
          ),
        ),
        BlocProvider<BasketCubit>(
          create: (context) => BasketCubit(
            BasketRepository(
              BasketWebServices(),
            ),
          ),
        ),
      ],
      child: ProductScreen(
        id: id,
      ),
    );
  }
}

class ProductScreen extends StatefulWidget {
  final int id;

  const ProductScreen({required this.id, Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductCubit>(context).getProduct(widget.id);
    BlocProvider.of<MeCubit>(context).getMe();

    super.initState();
  }

  var badgeController = Get.put(BadgeController());

  int counter = 1;
  bool isLoggedIn = false;
  // bool? hasData = false;
  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
      screen: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BlocBuilder<MeCubit, MeState>(
          builder: (context, state) {
            return BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoaded) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    height: 107.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Color.fromRGBO(0, 0, 0, 0.04),
                      //     blurRadius: 2.r,
                      //   )
                      // ],
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
                              if (counter > 1) counter--;
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
                            //  state.product!.data!.inCart!
                            //    ?
                            '$counter'.toString(),
                            // : widget.cartQuantity.toString(),
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
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
                              if (counter == state.product!.data!.stock!) {
                                BotToast.showText(
                                    text: translator.translate(
                                        "product_screen.unavailable_quantity"));
                              }
                              if (counter < state.product!.data!.stock!)
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
                        CustomButton(
                          onPress: () async {
                            if (Prefs.getBool("logged") == false) {
                              String oldQuantity =
                                  Prefs.getString("totalItems") ?? "0";
                              Prefs.setString(
                                  "totalItems",
                                  (int.parse(oldQuantity) + counter)
                                      .toString());
                              badgeController.badgeValue(
                                  (int.parse(oldQuantity) + counter));
                              {
                                await BlocProvider.of<BasketCubit>(context)
                                    .addProductInLocalBasket(
                                  BasketLocal(
                                    productId: state.product!.data!.id,
                                    quantity: counter,
                                    image:
                                        (state.product!.data!.images != null &&
                                                state.product!.data!.images!
                                                    .isNotEmpty)
                                            ? state.product!.data!.images![0]
                                            : "",
                                    price:
                                        state.product!.data!.price.toString(),
                                    stock: state.product!.data!.stock,
                                    vendor: state
                                        .product!.data!.vendor!.companyName,
                                    name: state.product!.data!.name,
                                    priceBeforeDiscount: state
                                        .product!.data!.priceBeforeDiscount,
                                  ),
                                );
                                AppmetricaSdk()
                                    .reportEvent(name: 'Added to Local Cart');
                              }
                            } else {
                              BlocProvider.of<BasketCubit>(context)
                                  .getAddToCartByItem(
                                      state.product!.data!.id!, counter);
                              AppmetricaSdk()
                                  .reportEvent(name: 'Added to Server Cart');
                            }
                            showModalBottomSheet(
                              enableDrag: false,
                              isDismissible: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.r),
                                  topRight: Radius.circular(25.r),
                                ),
                              ),
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return CheckoutPopUpProvider(
                                  meLoaded: state is MeIsLoaded &&
                                      (Prefs.getBool("logged") != null &&
                                          Prefs.getBool("logged") == true),
                                  basketLocal: BasketLocal(
                                    productId: int.parse(
                                        state.product!.data!.id.toString()),
                                    quantity: counter,
                                    stock: state.product!.data!.stock,
                                    image:
                                        (state.product!.data!.images != null &&
                                                state.product!.data!.images!
                                                    .isNotEmpty)
                                            ? state.product!.data!.images![0]
                                            : "",
                                    price:
                                        state.product!.data!.price.toString(),
                                    vendor: state
                                        .product!.data!.vendor!.companyName,
                                    name: state.product!.data!.name,
                                    priceBeforeDiscount: state
                                        .product!.data!.priceBeforeDiscount,
                                  ),
                                  title: state.product!.data!.name,
                                  image: state.product!.data!.images![0],
                                  totalPrice:
                                      state.product!.data!.price.toString(),
                                  // state: state,
                                );
                              },
                            );
                          },
                          width: 170.w,
                          height: 50.h,
                          assetName: Assets.iconsShoppingBasket,
                          borderRadius: 25.r,
                          title: translator
                              .translate("product_screen.add_to_basket"),
                          // buttonColor: Theme.of(context).primaryColor,
                          imageColor: Theme.of(context).colorScheme.secondary,
                          imageHeight: 18.h,
                          imageWidth: 24.w,
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          },
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<MeCubit, MeState>(
              listener: (context, state) async {
                if (state is MeIsLoaded &&
                    (Prefs.getBool("logged") != null &&
                        Prefs.getBool("logged") == true)) {
                  isLoggedIn = true;
                } else {
                  isLoggedIn = false;
                }
              },
            ),
          ],
          child: BlocBuilder<MeCubit, MeState>(
            builder: (context, state) {
              return BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoaded) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 45.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 23.h, horizontal: 15.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(
                                      context,
                                      //    hasData = true,
                                    );
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) {
                                    //       return HomePage(currentIndex: 0);
                                    //     },
                                    //   ),
                                    // );
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 20.w,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePageProvider(
                                          currentIndex: 1,
                                        ),
                                      ),
                                    );
                                  },
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
                            height: 280.h,
                            child: Swiper(
                              outer: true,
                              itemCount: state.product!.data!.images!.length,
                              autoplay: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  // color: Colors.red,
                                  child: CustomNetworkImage(
                                    imageUrl:
                                        state.product!.data!.images![index]!,
                                    height: 280.h,
                                    width: 142.w,
                                    radius: 2.r,
                                    fit: BoxFit.contain,
                                  ),
                                );
                              },
                              pagination: SwiperPagination(
                                margin: EdgeInsets.only(top: 10.h),
                                builder: DotSwiperPaginationBuilder(
                                  color: Colors.red,
                                  activeColor: Theme.of(context).primaryColor,
                                  size: 12.h,
                                  space: 4.w,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15.w, left: 15.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                state.product!.data!.discount == 0
                                    ? SizedBox.shrink()
                                    : Container(
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ),
                                Container(
                                  height: 38.h,
                                  width: 38.w,
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(25.r),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //       color: Color.fromRGBO(0, 0, 0, 0.12),
                                    //       offset: Offset(0, 2),
                                    //       blurRadius: 11.r)
                                    // ],
                                  ),
                                  child: WishlistIconWidget(
                                    productId:
                                        state.product!.data!.id.toString(),
                                    isFavorite:
                                        state.product!.data!.inWishlist!,
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
                          state.product!.data!.rate != 0
                              ? Padding(
                                  padding: EdgeInsets.only(
                                    top: 15.h,
                                    right: 12.w,
                                    left: 12.w,
                                  ),
                                  child: Container(
                                    height: 12.h,
                                    //width: 200.w,
                                    child: RatingBarComponent(
                                      rate:
                                          state.product!.data!.rate!.toDouble(),
                                    ),
                                  ),
                                )
                              : SizedBox.shrink(),
                          state.product!.data!.discount != 0
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      top: 15.h, right: 15.w, left: 15.w),
                                  child: Text(
                                    '${state.product!.data!.priceBeforeDiscount ?? ''} ${translator.translate("product_screen.egp")}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.black45,
                                        ),
                                  ),
                                )
                              : SizedBox.shrink(),
                          Padding(
                            padding: EdgeInsets.only(
                                top: state.product!.data!.discount != 0
                                    ? 8.h
                                    : 15.h,
                                right: 15.w,
                                left: 15.w),
                            child: Text(
                              '${state.product!.data!.price!} ${translator.translate("product_screen.egp")}',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //       top: 15.h, right: 12.w, left: 12.w),
                          //   child: Container(
                          //     width: MediaQuery.of(context).size.width,
                          //     height: 50.h,
                          //     child: ListView.builder(
                          //       scrollDirection: Axis.horizontal,
                          //       itemCount: weight.length,
                          //       itemBuilder: (context, index) => Padding(
                          //         padding: EdgeInsets.only(left: 6.w),
                          //         child: CustomOutlineButton(
                          //           title: weight[index],
                          //           height: 40.h,
                          //           width: 160.w,
                          //           onPress: () {
                          //             setState(() {
                          //               _selectedIndex = index;
                          //             });
                          //           },
                          //           shadowColor: BoxShadow(
                          //             color: _selectedIndex == index
                          //                 ? Color.fromARGB(41, 16, 124, 192)
                          //                 : Colors.transparent,
                          //             blurRadius: 7.r,
                          //           ),
                          //           borderRadius: 4.r,
                          //           borderColor: _selectedIndex == index
                          //               ? Theme.of(context).primaryColor
                          //               : Color(0xffE3E3E3),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 24.h, right: 15.w, left: 15.w),
                            child: Text(
                              translator
                                  .translate("product_screen.about_this_item"),
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                                top: 15.h, right: 15.w, left: 15.w),
                            child: HtmlWidget(
                              state.product!.data!.description!,
                              textStyle: Theme.of(context).textTheme.subtitle2,
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
                              translator
                                  .translate("product_screen.product_overview"),
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 15.h,
                              right: 15.w,
                              left: 15.w,
                            ),
                            child: GridView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: state.product!.data!.overview2!.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10.h,
                                childAspectRatio: 130.w / 30.h,
                              ),
                              itemBuilder: (context, index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state
                                        .product!.data!.overview2![index]!.key!,
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
                                    state.product!.data!.overview2![index]!
                                        .value!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(height: 1.h),
                                  ),
                                ],
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
                              translator
                                  .translate("product_screen.about_seller"),
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print('${state.product!.data!.vendorId}');
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return CategoryScreenProvider(
                                    categoryName:
                                        state.product!.data!.category!.name,
                                    subCategories: [],
                                    multiMap: {},
                                    rangeMap: {},
                                    singleMap: {},
                                    categoriesId:
                                        state.product!.data!.category!.id,
                                    vendorId: state.product!.data!.vendorId,
                                  );
                                }),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 25.sp,
                                  foregroundImage: NetworkImage(
                                      state.product!.data!.vendor!.coverPhoto!),
                                ),
                                title: Text(
                                  translator
                                      .translate("product_screen.seller_name"),
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
                                  state.product!.data!.vendor!.companyName ??
                                      '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          // Container(
                          //   padding: EdgeInsets.only(left: 15.w),
                          //   height: 47.h,
                          //   width: MediaQuery.of(context).size.width,
                          //   color: Color(0xffDDF0FC),
                          //   child: Row(
                          //     children: [
                          //       Container(
                          //         height: 35.h,
                          //         width: 35.w,
                          //         alignment: Alignment.center,
                          //         decoration: BoxDecoration(
                          //           color: Color(0xffDDF0FC),
                          //           borderRadius: BorderRadius.all(
                          //             Radius.circular(
                          //               19.5.r,
                          //             ),
                          //           ),
                          //         ),
                          //         child: Text(
                          //           '3',
                          //           textAlign: TextAlign.center,
                          //           style: Theme.of(context)
                          //               .textTheme
                          //               .subtitle2!
                          //               .copyWith(
                          //                 color: Theme.of(context).primaryColor,
                          //                 fontSize: 14.sp,
                          //               ),
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: 5.w,
                          //       ),
                          //       Text(
                          //         'Other offers from EGP 240',
                          //         style: Theme.of(context)
                          //             .textTheme
                          //             .subtitle2!
                          //             .copyWith(
                          //               color: Theme.of(context).primaryColor,
                          //               fontSize: 14.sp,
                          //             ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   height: 280.h,
                          //   color: Colors.red,
                          //   child: Stack(
                          //     fit: StackFit.loose,
                          //     children: [
                          //       // Container(
                          //       //   width: MediaQuery.of(context).size.width,
                          //       //   height: 280.h,
                          //       //   decoration: BoxDecoration(
                          //       //     color: Colors.yellow,
                          //       //     borderRadius: BorderRadius.only(
                          //       //       topLeft: Radius.circular(35.r),
                          //       //       topRight: Radius.circular(35.r),
                          //       //     ),
                          //       //   ),
                          //       // ),
                          //       // Positioned(
                          //       //   top: 10.h,
                          //       //   left: 100.h,
                          //       //   right: 100.h,
                          //       //   child: Container(
                          //       //     height: 220.h,
                          //       //     child: CarouselSlider(
                          //       //       options: CarouselOptions(
                          //       //         autoPlay: false,
                          //       //         enlargeCenterPage: true,
                          //       //       ),
                          //       //       items:
                          //       //           state.product!.data!.images!.map((image) {
                          //       //         return CustomNetworkImage(
                          //       //             imageUrl: image!,
                          //       //             height: 260.h,
                          //       //             width: 142.w,
                          //       //             radius: 2.r);
                          //       //         // return Image.network(
                          //       //         //   image!,
                          //       //         //   fit: BoxFit.fill,
                          //       //         //   // height: 260.h,
                          //       //         //   // width: 142.w,
                          //       //         // );
                          //       //       }).toList(),
                          //       //     ),
                          //       //   ),
                          //       // ),
                          //     ],
                          //   ),
                          // ),
                          // Container(
                          //   color: Colors.white,
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
