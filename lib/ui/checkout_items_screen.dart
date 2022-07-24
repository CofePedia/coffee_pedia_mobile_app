import 'package:coffepedia/business_logic/basket/basket_cubit.dart';
import 'package:coffepedia/business_logic/me/me_cubit.dart';
import 'package:coffepedia/data/repository/basket_repository.dart';
import 'package:coffepedia/data/repository/me_repository.dart';
import 'package:coffepedia/data/web_services/basket_web_services.dart';
import 'package:coffepedia/data/web_services/me_web_services.dart';
import 'package:coffepedia/main.dart';
import 'package:coffepedia/services/preferences.dart';
import 'package:coffepedia/ui/basket_empty_screen.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/screens/intro/login_register_screen.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'checkout_item.dart';
import 'delivery_info_screen.dart';

class CheckoutItemsScreenProvider extends StatelessWidget {
  final Function? onAddPressed;

  const CheckoutItemsScreenProvider({
    this.onAddPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
      child: CheckoutItemsScreen(
        onAddPressed: onAddPressed!,
      ),
    );
  }
}

class CheckoutItemsScreen extends StatefulWidget {
  const CheckoutItemsScreen({required this.onAddPressed});
  final Function onAddPressed;
  @override
  State<CheckoutItemsScreen> createState() => _CheckoutItemsScreenState();
}

class _CheckoutItemsScreenState extends State<CheckoutItemsScreen> {
  @override
  void initState() {
    super.initState();
    // init();
    BlocProvider.of<MeCubit>(context).getMe();
  }

  bool isLoggedIn = false;

  // final TextEditingController coupon = TextEditingController();
  // bool discountLoading = false;
  // String? subTotal;
  // String? discount;
  // String? deliveryCharge;
  // String? total;

  // init() async {
  //   BlocProvider.of<MeCubit>(context).getMe();
  //   //final userDao = UserDao();
  //   //GetTokenDatabase? token = await userDao.getUserToken();
  // }

  @override
  Widget build(BuildContext context) {
    if (Prefs.getBool("logged") == false || Prefs.getBool("logged") == null) {
      BlocProvider.of<BasketCubit>(context).getAllLocalProductsFromBasket();
      // widget.onAddPressed();
    }
    if (Prefs.getBool("logged") == true && Prefs.getBool("logged") != null) {
      BlocProvider.of<BasketCubit>(context).getBasket();
      // widget.onAddPressed();
    }

    return CheckInternetConnection(
      screen: MultiBlocListener(
        listeners: [
          // BlocListener<BasketCubit, BasketState>(
          //   listener: (context, state) {
          //     // if (state is AddToBasketIsPressed) {
          //     //   if (isLoggedIn) {
          //     //     BlocProvider.of<BasketCubit>(context).getBasket();
          //     //   } else {
          //     //     BlocProvider.of<BasketCubit>(context)
          //     //         .getAllLocalProductsFromBasket();
          //     //   }
          //     // }
          //   },
          // ),
          BlocListener<MeCubit, MeState>(
            listener: (context, state) {
              if (state is MeIsLoaded &&
                  (Prefs.getBool("logged") != null &&
                      Prefs.getBool("logged") == true)) {
                print("user");
                isLoggedIn = true;
                // BlocProvider.of<BasketCubit>(context).getBasket();
              } else if (state is MeIsNotExist &&
                  (Prefs.getBool("logged") == null ||
                      Prefs.getBool("logged") == false)) {
                // BlocProvider.of<BasketCubit>(context).getAllLocalProductsFromBasket();
                isLoggedIn = false;
                print("local");
              }
            },
          ),
        ],
        child: BlocBuilder<BasketCubit, BasketState>(
          builder: (context, state) {
            if (state is BasketLoaded) {
              return state.basket!.data!.items!.length > 0 &&
                      isLoggedIn &&
                      Prefs.getBool("logged") == true &&
                      Prefs.getBool("logged") != null
                  ? Scaffold(
                      backgroundColor: Colors.white,
                      bottomNavigationBar: Padding(
                        padding: EdgeInsets.only(bottom: 69.h),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 145.h,
                          padding: EdgeInsets.symmetric(
                            vertical: 21.h,
                            horizontal: 15.w,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22.r),
                              topRight: Radius.circular(22.r),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    translator.translate(
                                        "checkout_items_screen.total_price"),
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  Text(
                                    translator.currentLanguage == "ar"
                                        ? "${state.basket!.data!.total} ${translator.translate("checkout_items_screen.egp")}"
                                        : "${translator.translate("checkout_items_screen.egp")} ${state.basket!.data!.total}",
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              CustomButton(
                                title: translator.translate(
                                    "checkout_items_screen.Proceed to checkout"),
                                onPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const DeliveryInfoScreenProvider();
                                      },
                                    ),
                                  );
                                },
                                width: 345.w,
                                height: 50.h,
                                borderRadius: 25.r,
                                // buttonColor: Theme.of(context).primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                      body: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 60.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    translator.translate(
                                        "checkout_items_screen.shopping_basket"),
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                          color: Colors.black,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 24.6.h,
                                      horizontal: 0,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          translator.translate(
                                              "checkout_items_screen.items"),
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(
                                                color: Colors.black,
                                              ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          "(${state.basket!.data!.totalItems} ${translator.translate("checkout_items_screen.item")})",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(
                                                color: Colors.black,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                itemCount: state.basket!.data!.items!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    child: CheckoutItemProvider(
                                      productId: state
                                          .basket!.data!.items![index]!.id!
                                          .toString(),
                                      stock: state
                                          .basket!.data!.items![index]!.stock,
                                      price: state
                                          .basket!.data!.items![index]!.price
                                          .toString(),
                                      title: state.basket!.data!.items![index]!
                                              .name ??
                                          '',
                                      priceBeforeDiscount: state.basket!.data!
                                          .items![index]!.priceBeforeDiscount,
                                      image: state
                                          .basket!.data!.items![index]!.image!,
                                      quantity: state.basket!.data!
                                          .items![index]!.quantity!,
                                      vendor: state.basket!.data!.items![index]!
                                              .vendor ??
                                          '',
                                      isLocal: isLoggedIn ? false : true,
                                      onRemoveItem: () {
                                        setState(() {});
                                        BlocProvider.of<BasketCubit>(context)
                                            .getBasket();
                                        widget.onAddPressed();
                                      },
                                      onItemAdded: () {
                                        setState(() {});
                                        widget.onAddPressed();
                                      },
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(
                                      vertical: 15.75.h,
                                    ),
                                    height: 1.h,
                                    color: Color(0xff979797),
                                  );
                                },
                              ),
                            ),
                            // Container(
                            //   width: MediaQuery.of(context).size.width,
                            //   color: Color(0xffF8F8F8),
                            //   padding: EdgeInsets.symmetric(
                            //     horizontal: 16.w,
                            //     vertical: 16.h,
                            //   ),
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     crossAxisAlignment:
                            //         CrossAxisAlignment.start,
                            //     children: [
                            //       Text(
                            //         translator.translate(
                            //             "checkout_items_screen.have_coupon"),
                            //         style: Theme.of(context)
                            //             .textTheme
                            //             .bodyText1!
                            //             .copyWith(fontSize: 14.sp),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.symmetric(
                            //             vertical: 16.h),
                            //         child: Container(
                            //           height: 40.h,
                            //           child: TextFormField(
                            //             maxLines: 1,
                            //             controller: coupon,
                            //             showCursor: true,
                            //             cursorColor:
                            //                 Theme.of(context).primaryColor,
                            //             keyboardType: TextInputType.text,
                            //             style: TextStyle(
                            //                 color: Colors.black45),
                            //             inputFormatters: [
                            //               WhiteSpacesInputFormatter(),
                            //             ],
                            //             decoration: InputDecoration(
                            //               fillColor: Colors.white,
                            //               filled: true,
                            //               hintText: translator.translate(
                            //                   "checkout_items_screen.coupon_code"),
                            //               hintStyle: Theme.of(context)
                            //                   .textTheme
                            //                   .headline4!
                            //                   .copyWith(
                            //                     color: Color(0xffcccccc),
                            //                   ),
                            //               border: OutlineInputBorder(
                            //                 borderRadius:
                            //                     BorderRadius.circular(5.w),
                            //                 borderSide: BorderSide(
                            //                   color: Colors.transparent,
                            //                   width: 1.w,
                            //                 ),
                            //               ),
                            //               enabledBorder: OutlineInputBorder(
                            //                 borderRadius:
                            //                     BorderRadius.circular(5.w),
                            //                 borderSide: BorderSide(
                            //                   color: Colors.transparent,
                            //                   width: 1.w,
                            //                 ),
                            //               ),
                            //               alignLabelWithHint: true,
                            //               suffixIcon: InkWell(
                            //                 onTap: () {
                            //                   if (coupon.text
                            //                       .trim()
                            //                       .isNotEmpty) {
                            //                     BlocProvider.of<
                            //                                 BasketCubit>(
                            //                             context)
                            //                         .getCoupon(coupon.text);
                            //                   }
                            //                 },
                            //                 child: Container(
                            //                   height: 40.h,
                            //                   width: 90.w,
                            //                   decoration: BoxDecoration(
                            //                     borderRadius:
                            //                         BorderRadius.circular(
                            //                       5.r,
                            //                     ),
                            //                     color: Color(0xff107CC0),
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   child: Text(
                            //                     translator.translate(
                            //                         "checkout_items_screen.apply"),
                            //                     style: Theme.of(context)
                            //                         .textTheme
                            //                         .headline2!
                            //                         .copyWith(
                            //                           fontWeight:
                            //                               FontWeight.w500,
                            //                         ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //       Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Text(
                            //               translator.translate(
                            //                   "checkout_items_screen.subtotal"),
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .headline4),
                            //           Text(
                            //             isPressed == false
                            //                 ? "${state.basket!.data!.subTotal} ${translator.translate("checkout_items_screen.egp")}"
                            //                 : "$subTotal ${translator.translate("checkout_items_screen.egp")}",
                            //             style: Theme.of(context)
                            //                 .textTheme
                            //                 .headline4,
                            //           ),
                            //         ],
                            //       ),
                            //       SizedBox(
                            //         height: 5.h,
                            //       ),
                            //       Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Text(
                            //               translator.translate(
                            //                   "checkout_items_screen.discount"),
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .headline4),
                            //           Text(
                            //               isPressed == false
                            //                   ? "- ${state.basket!.data!.discount} ${translator.translate("checkout_items_screen.egp")}"
                            //                   : "- $discount ${translator.translate("checkout_items_screen.egp")}",
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .headline4),
                            //         ],
                            //       ),
                            //       SizedBox(
                            //         height: 5.h,
                            //       ),
                            //       Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Text(
                            //               translator.translate(
                            //                   "checkout_items_screen.delivery_charge"),
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .headline4),
                            //           Text(
                            //             isPressed == false
                            //                 ? "${state.basket!.data!.deliveryCharge} ${translator.translate("checkout_items_screen.egp")}"
                            //                 : "$deliveryCharge ${translator.translate("checkout_items_screen.egp")}",
                            //             style: Theme.of(context)
                            //                 .textTheme
                            //                 .headline4,
                            //           ),
                            //         ],
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.only(
                            //             top: 16.h, bottom: 28.h),
                            //         child: Row(
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.spaceBetween,
                            //           children: [
                            //             Text(
                            //               translator.translate(
                            //                   "checkout_items_screen.total_price"),
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .headline4,
                            //             ),
                            //             Text(
                            //               isPressed == false
                            //                   ? " ${state.basket!.data!.total} ${translator.translate("checkout_items_screen.egp")}"
                            //                   : " $total ${translator.translate("checkout_items_screen.egp")}",
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .caption!
                            //                   .copyWith(
                            //                     color: Color(0xff107CC0),
                            //                   ),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //       // Row(
                            //       //   mainAxisAlignment: MainAxisAlignment.center,
                            //       //   children: [
                            //       //     SvgPicture.asset(
                            //       //       Assets.imagesVisaLogo,
                            //       //       width: 53.w,
                            //       //       height: 25.h,
                            //       //     ),
                            //       //     SizedBox(
                            //       //       width: 7.w,
                            //       //     ),
                            //       //     SvgPicture.asset(
                            //       //       Assets.imagesMastercardLogo,
                            //       //       width: 44.w,
                            //       //       height: 28.h,
                            //       //     ),
                            //       //   ],
                            //       // )
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                      ))
                  : BasketEmptyScreen(
                      isLoggedIn: isLoggedIn,
                      onAddTapped: widget.onAddPressed,
                    );
            }
            if (state is LocalBasketLoaded) {
              print("basket loaded in local");
              int totalPrice = 0; //total price
              int totalItems = 0;

              // int totalPriceBeforeDiscount = 0; //subtotal
              if (state.basketLocalList.length > 0) {
                state.basketLocalList.forEach((element) {
                  totalPrice = totalPrice + int.parse(element.price.toString());
                  // totalPriceBeforeDiscount = totalPriceBeforeDiscount +
                  //     int.parse(element.priceBeforeDiscount.toString());
                  totalPrice = totalPrice * element.quantity!;
                  totalItems = totalItems + element.quantity!;
                  // totalPriceBeforeDiscount =
                  //     totalPriceBeforeDiscount * element.quantity!;
                });
              }
              Prefs.setString("totalItems", totalItems.toString());
              // int discountM = totalPriceBeforeDiscount - totalPrice;
              // totalPrice = totalPrice;
              // String? subTotal = totalPriceBeforeDiscount.toString();
              // String? discount = discountM.toString();
              // String? deliveryCharge = "50";
              // String? total = totalPrice.toString();

              //TODO: LOCAL
              return state.basketLocalList.length > 0 &&
                          isLoggedIn == false &&
                          Prefs.getBool("logged") == false ||
                      Prefs.getBool("logged") == null
                  ? Scaffold(
                      backgroundColor: Colors.white,
                      bottomNavigationBar: Padding(
                        padding: EdgeInsets.only(bottom: 69.h),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 145.h,
                          padding: EdgeInsets.symmetric(
                            vertical: 21.h,
                            horizontal: 15.w,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22.r),
                              topRight: Radius.circular(22.r),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    translator.translate(
                                        "checkout_items_screen.total_price"),
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  Text(
                                    translator.currentLanguage == "ar"
                                        ? "${totalPrice.toString()} ${translator.translate("checkout_items_screen.egp")}"
                                        : "${translator.translate("checkout_items_screen.egp")} ${totalPrice.toString()}",
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              CustomButton(
                                title: translator.translate(
                                    "checkout_items_screen.Proceed to checkout"),
                                onPress: () {
                                  if (isLoggedIn) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const DeliveryInfoScreenProvider();
                                        },
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return LoginPage();
                                        },
                                      ),
                                    );
                                  }
                                },
                                width: 345.w,
                                height: 50.h,
                                borderRadius: 25.r,
                                // buttonColor: Theme.of(context).primaryColor,
                              ),
                            ],
                          ),
                          // child: ElevatedButton(
                          //   onPressed: () {
                          //     if (isLoggedIn) {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) {
                          //             return const DeliveryInfoScreenProvider();
                          //           },
                          //         ),
                          //       );
                          //     } else {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) {
                          //             return const LoginPage();
                          //           },
                          //         ),
                          //       );
                          //     }
                          //   },
                          //   style: ButtonStyle(
                          //     shape: MaterialStateProperty.all(
                          //       RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(25.r),
                          //       ),
                          //     ),
                          //   ),
                          //   child: Text(
                          //     translator.translate(
                          //         "checkout_popup.proceed_to_checkout"),
                          //     style: Theme.of(context).textTheme.headline2,
                          //   ),
                          // ),
                        ),
                      ),
                      body: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 60.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    translator.translate(
                                        "checkout_items_screen.shopping_basket"),
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                          color: Colors.black,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 24.6.h,
                                      horizontal: 0,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          translator.translate(
                                              "checkout_items_screen.items"),
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(
                                                color: Colors.black,
                                              ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          "($totalItems ${translator.translate("checkout_items_screen.item")})",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4!
                                              .copyWith(
                                                color: Colors.black,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                itemCount: state.basketLocalList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                    ),
                                    child: CheckoutItemProvider(
                                      productId: state
                                          .basketLocalList[index].productId
                                          .toString(),
                                      stock:
                                          state.basketLocalList[index].stock ??
                                              0,
                                      price: state.basketLocalList[index].price
                                          .toString(),
                                      title: state.basketLocalList[index].name
                                          .toString(),
                                      priceBeforeDiscount: state
                                          .basketLocalList[index]
                                          .priceBeforeDiscount,
                                      image: state.basketLocalList[index].image
                                          .toString(),
                                      quantity: state
                                          .basketLocalList[index].quantity!,
                                      vendor: state
                                          .basketLocalList[index].vendor
                                          .toString(),
                                      isLocal: isLoggedIn ? false : true,
                                      onRemoveItem: () {
                                        setState(() {});
                                        widget.onAddPressed();
                                      },
                                      onItemAdded: () {
                                        // setState(() {});
                                        widget.onAddPressed();
                                      },
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(vertical: 15.75.h),
                                    height: 1.h,
                                    color: Color(0xff979797),
                                  );
                                },
                              ),
                            ),
                            // Container(
                            //   width: MediaQuery.of(context).size.width,
                            //   color: Color(0xffF8F8F8),
                            //   padding: EdgeInsets.symmetric(
                            //     horizontal: 16.w,
                            //     vertical: 16.h,
                            //   ),
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     crossAxisAlignment:
                            //         CrossAxisAlignment.start,
                            //     children: [
                            //       Text(
                            //         translator.translate(
                            //             "checkout_items_screen.have_coupon"),
                            //         style: Theme.of(context)
                            //             .textTheme
                            //             .bodyText1!
                            //             .copyWith(fontSize: 14.sp),
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.symmetric(
                            //             vertical: 16.h),
                            //         child: Container(
                            //           height: 40.h,
                            //           child: TextFormField(
                            //             maxLines: 1,
                            //             controller: coupon,
                            //             showCursor: true,
                            //             cursorColor:
                            //                 Theme.of(context).primaryColor,
                            //             keyboardType: TextInputType.text,
                            //             style: TextStyle(
                            //                 color: Colors.black45),
                            //             inputFormatters: [
                            //               WhiteSpacesInputFormatter(),
                            //             ],
                            //             decoration: InputDecoration(
                            //               fillColor: Colors.white,
                            //               filled: true,
                            //               hintText: translator.translate(
                            //                   "checkout_items_screen.coupon_code"),
                            //               hintStyle: Theme.of(context)
                            //                   .textTheme
                            //                   .headline4!
                            //                   .copyWith(
                            //                     color: Color(0xffcccccc),
                            //                   ),
                            //               border: OutlineInputBorder(
                            //                 borderRadius:
                            //                     BorderRadius.circular(5.w),
                            //                 borderSide: BorderSide(
                            //                   color: Colors.transparent,
                            //                   width: 1.w,
                            //                 ),
                            //               ),
                            //               enabledBorder: OutlineInputBorder(
                            //                 borderRadius:
                            //                     BorderRadius.circular(5.w),
                            //                 borderSide: BorderSide(
                            //                   color: Colors.transparent,
                            //                   width: 1.w,
                            //                 ),
                            //               ),
                            //               alignLabelWithHint: true,
                            //               suffixIcon: InkWell(
                            //                 onTap: () {
                            //                   if (coupon.text
                            //                       .trim()
                            //                       .isNotEmpty) {
                            //                     BlocProvider.of<
                            //                                 BasketCubit>(
                            //                             context)
                            //                         .getCoupon(coupon.text);
                            //                   }
                            //                 },
                            //                 child: Container(
                            //                   height: 40.h,
                            //                   width: 90.w,
                            //                   decoration: BoxDecoration(
                            //                     borderRadius:
                            //                         BorderRadius.circular(
                            //                             5.r),
                            //                     color: Color(0xff107CC0),
                            //                   ),
                            //                   alignment: Alignment.center,
                            //                   child: Text(
                            //                     translator.translate(
                            //                         "checkout_items_screen.apply"),
                            //                     style: Theme.of(context)
                            //                         .textTheme
                            //                         .headline2!
                            //                         .copyWith(
                            //                           fontWeight:
                            //                               FontWeight.w500,
                            //                         ),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //       Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Text(
                            //               translator.translate(
                            //                   "checkout_items_screen.subtotal"),
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .headline4),
                            //           Text(
                            //               isPressed == false
                            //                   ? "$subTotal ${translator.translate("checkout_items_screen.egp")}"
                            //                   : "$subTotal ${translator.translate("checkout_items_screen.egp")}",
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .headline4),
                            //         ],
                            //       ),
                            //       SizedBox(
                            //         height: 5.h,
                            //       ),
                            //       Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Text(
                            //               translator.translate(
                            //                   "checkout_items_screen.discount"),
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .headline4),
                            //           Text(
                            //               isPressed == false
                            //                   ? "- $discount ${translator.translate("checkout_items_screen.egp")}"
                            //                   : "- $discount ${translator.translate("checkout_items_screen.egp")}",
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .headline4),
                            //         ],
                            //       ),
                            //       SizedBox(
                            //         height: 5.h,
                            //       ),
                            //       Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Text(
                            //               translator.translate(
                            //                   "checkout_items_screen.delivery_charge"),
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .headline4),
                            //           Text(
                            //             isPressed == false
                            //                 ? "$deliveryCharge ${translator.translate("checkout_items_screen.egp")}"
                            //                 : "$deliveryCharge ${translator.translate("checkout_items_screen.egp")}",
                            //             style: Theme.of(context)
                            //                 .textTheme
                            //                 .headline4,
                            //           ),
                            //         ],
                            //       ),
                            //       Padding(
                            //         padding: EdgeInsets.only(
                            //             top: 16.h, bottom: 28.h),
                            //         child: Row(
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.spaceBetween,
                            //           children: [
                            //             Text(
                            //                 translator.translate(
                            //                     "checkout_items_screen.total_price"),
                            //                 style: Theme.of(context)
                            //                     .textTheme
                            //                     .headline4),
                            //             Text(
                            //               isPressed == false
                            //                   ? " $total ${translator.translate("checkout_items_screen.egp")}"
                            //                   : " $total ${translator.translate("checkout_items_screen.egp")}",
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .caption!
                            //                   .copyWith(
                            //                     color: Color(0xff107CC0),
                            //                   ),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //       // Row(
                            //       //   mainAxisAlignment: MainAxisAlignment.center,
                            //       //   children: [
                            //       //     SvgPicture.asset(
                            //       //       Assets.imagesVisaLogo,
                            //       //       width: 53.w,
                            //       //       height: 25.h,
                            //       //     ),
                            //       //     SizedBox(
                            //       //       width: 7.w,
                            //       //     ),
                            //       //     SvgPicture.asset(
                            //       //       Assets.imagesMastercardLogo,
                            //       //       width: 44.w,
                            //       //       height: 28.h,
                            //       //     ),
                            //       //   ],
                            //       // )
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    )
                  //
                  : BasketEmptyScreen(
                      isLoggedIn: isLoggedIn,
                      onAddTapped: widget.onAddPressed,
                    );
            } else if (state is LocalBasketError) {
              return Center(
                child: Text("error"),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class WhiteSpacesInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var string = text.trim();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}
